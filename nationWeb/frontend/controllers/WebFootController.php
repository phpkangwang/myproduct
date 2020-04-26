<?php
namespace backend\controllers;

use common\models\ErrorCode;
use common\models\MyException;
use common\models\News;
use common\models\WebFoot;

/**
 * Site controller
 */
class WebFootController extends MyController
{
    public function actionAdd()
    {
        try {
            if (
                !isset($this->post['section'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $nation = isset( $this->post['nation'] ) ? $this->post['nation'] : $this->loginInfo['nation'];

            $id = isset( $this->post['id'] ) ? $this->post['id'] : "";
            if($id == ""){
                $Model = new WebFoot();
            }else{
                $Model =  WebFoot::findOne($id);
                if( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation']){
                }else{
                    throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
                }
            }

            $postData = array(
                'section' => $this->post['section'],
                'list' => isset( $this->post['list'] ) ? $this->post['list'] : "",
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
     *   获取这个表的所有数据
     */
    public function actionTableList()
    {
        $Model = new WebFoot();
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
            $this->get['section'] = isset($this->get['section']) ? $this->get['section'] : "";
            $this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];

            $Model = new WebFoot();
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
            $obj = WebFoot::findOne($this->get['id']);
            if( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation']){
            }else{
                throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
            }

            $Model = new WebFoot();
            $Model->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }
}
