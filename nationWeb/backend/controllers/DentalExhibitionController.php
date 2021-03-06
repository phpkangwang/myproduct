<?php
namespace backend\controllers;

use common\models\DentalExhibition;
use common\models\ErrorCode;
use common\models\MyException;

/**
 * Site controller
 */
class DentalExhibitionController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new DentalExhibition();
	}

    public function actionAdd()
    {
        try {
            if (
                !isset($this->post['title']) ||
                !isset($this->post['date']) ||
                !isset($this->post['time']) ||
                !isset($this->post['location'])||
                !isset($this->post['url']) ||
                !isset($this->post['description'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $nation = $this->loginInfo['nation'];
            $id = isset( $this->post['id'] ) ? $this->post['id'] : "";
            if($id == ""){
                $Model = new DentalExhibition();
            }else{
                $Model =  DentalExhibition::findOne($id);
                if( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation']){
                }else{
                    throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
                }
            }

            $postData = array(
                'title' => $this->post['title'],
                'date' => $this->post['date'],
                'time' => $this->post['time'],
                'location' => $this->post['location'],
                'url' => $this->post['url'],
                'description' => $this->post['description'],
                'nation' => $nation,
                'create_time' => date("Y-m-d H:i:s",time()),
            );
            $Model->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->postMessage());
        }
    }


    /**
     *   获取这个表的所有数据
     */
    public function actionTableList()
    {
        $Model = new DentalExhibition();
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
            $this->get['title'] = isset($this->get['title']) ? $this->get['title'] : "";
            $this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];

            $Model = new DentalExhibition();
            $data = $Model->tablePage($this->get);
            $count = $Model->tableCount($this->get);
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
     *  删除
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
            $obj = DentalExhibition::findOne($this->get['id']);
            if( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation']){
            }else{
                throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
            }

            //删除数据
            $Model = new DentalExhibition();
            $Model->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }
}
