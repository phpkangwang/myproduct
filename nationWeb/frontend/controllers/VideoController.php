<?php

namespace frontend\controllers;

use common\models\ErrorCode;
use common\models\MyException;
use common\models\Video;

/**
 * Site controller
 */
class VideoController extends MyController
{
    public function actionAdd()
    {
        try {
            if (
                !isset($this->post['title']) ||
                !isset($this->post['menuId']) ||
                !isset($this->post['description']) ||
                !isset($this->post['type']) ||
                !isset($this->post['videoUrl']) ||
                !isset($this->post['imageUrl'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $nation = $this->loginInfo['nation'];
            $id = isset($this->post['id']) ? $this->post['id'] : "";
            if ($id == "") {
                $Model = new Video();
            } else {
                $Model = Video::findOne($id);
                if ($this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation']) {
                } else {
                    throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
                }
            }

            $postData = array(
                'title' => $this->post['title'],
                'menu_id' => $this->post['menuId'],
                'description' => $this->post['description'],
                'type' => $this->post['type'],
                'video_url' => $this->post['videoUrl'],
                'image_url' => $this->post['imageUrl'],
                'nation' => $nation,
                'create_time' => date("Y-m-d H:i:s", time()),
            );
            $Model->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    public function update()
    {
        if (
        !isset($this->get['id'])
        ) {
            throw new MyException(ErrorCode::ERROR_PARAM);
        }
        $Model =  Video::findOne($this->get['id']);
        if( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation']){
        }else{
            throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
        }
        $postData = $this->get;
        unset($postData['token']);
        $Model->add($postData);
        $this->sendJson();
    }

    /**
     *   获取这个表的所有数据
     */
    public function actionTableList()
    {
        $Model = new Video();
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
            $this->get['menuId'] = isset($this->get['menuId']) ? $this->get['menuId'] : "";
            $this->get['type'] = isset($this->get['type']) ? $this->get['type'] : "";
            $this->get['title'] = isset($this->get['title']) ? $this->get['title'] : "";
            $this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];

            $Model = new Video();
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
            $obj = Video::findOne($this->get['id']);
            if ($this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation']) {
            } else {
                throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
            }

            //删除数据
            $Model = new Video();
            $Model->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }
}
