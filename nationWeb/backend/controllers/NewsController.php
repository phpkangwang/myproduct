<?php
namespace backend\controllers;

use common\models\ErrorCode;
use common\models\MyException;
use common\models\News;

/**
 * Site controller
 */
class NewsController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new News();
	}

    public function actionAdd()
    {
        try {
            if (
                !isset($this->post['title']) ||
                !isset($this->post['description']) ||
                !isset($this->post['content'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $nation = isset( $this->post['nation'] ) ? $this->post['nation'] : $this->loginInfo['nation'];
            $id = isset( $this->post['id'] ) ? $this->post['id'] : "";
            if($id == ""){
                $Model = new News();
            }else{
                $Model =  News::findOne($id);
                if( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation']){
                }else{
                    throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
                }
            }

            $postData = array(
                'title' => $this->post['title'],
                'description' => $this->post['description'],
                'content' => $this->post['content'],
                'top' => 2,
                'nation' => $nation,
                'create_time' => date("Y-m-d H:i:s",time()),
            );
            $Model->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *    改变bannel显示状态
     */
    public function actionUpdateStatus()
    {
        try {
            if (
            !isset($this->get['id'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $id = $this->get['id'];
            $obj = News::findOne($id);
            if (empty($obj)) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            if( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation']){
            }else{
                throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
            }
            if ($obj->status == 1) {
                $postData['status'] = 2;
            } else {
                $postData['status'] = 1;
            }
            $obj->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *   获取这个表的所有数据
     */
    public function actionTableList()
    {
        $Model = new News();
        $data = $Model->tableList();
        $this->setData($data);
        $this->sendJson();
    }


    //分页获取数据
    public function actionPage()
    {
        try {
            if (
                !isset($this->get['pageNo']) ||
                !isset($this->get['pageSize'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $this->get['id'] = isset($this->get['id']) ? $this->get['id'] : "";
            $this->get['title'] = isset($this->get['title']) ? $this->get['title'] : "";
            $this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];
            $this->get['top'] = isset($this->get['top']) ? $this->get['top'] : "";

            $Model = new News();
            $data = $Model->tablePage($this->get);
            $count = $Model->tableCount($this->get);
			foreach ($data as $key=>$val){
				foreach ($val as $k=>$v){
					if($k == "content" || $k == "description" ){
						$data[$key][$k] = mb_substr($v, 0, 100);
					}
				}
			}
            $this->setData($data);
            $this->setPage(array(
                'pageNo' => $this->get['pageNo'],
                'maxPage' => ceil($count / $this->get['pageSize']),
                'count' => $count,
            ));
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }


    /**
     *  删除菜单
     */
    public function actionDel()
    {
        try {
            if (
            !isset($this->get['id'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            //首先得判断是否有权限操作
            $obj = News::findOne($this->get['id']);
            if( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation']){
            }else{
                throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
            }

            $AdminUserModel = new News();
            $AdminUserModel->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }
}
