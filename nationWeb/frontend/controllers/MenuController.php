<?php
namespace frontend\controllers;

use common\models\ErrorCode;
use common\models\Menu;
use common\models\MyException;

/**
 * Site controller
 */
class MenuController extends MyController
{
    public function actionAdd()
    {
        try {
            if (
                !isset($this->post['parentId']) ||
                !isset($this->post['name']) ||
                !isset($this->post['pathName'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $postData['parent_id'] = $this->post['parentId'];
            $postData['name'] = $this->post['name'];
            $postData['path_name'] = $this->post['pathName'];
            $postData['image_url'] = isset( $this->post['imageUrl'] ) ? $this->post['imageUrl'] : "";
            $postData['path'] = isset( $this->post['path'] ) ? $this->post['path'] : "";
            $postData['alias'] = isset( $this->post['alias'] ) ? $this->post['alias'] : "";
            $postData['out_link'] = isset( $this->post['outLink'] ) ? $this->post['outLink'] : "";
            $postData['sort'] = isset($this->post['sort']) ? $this->post['sort'] : 1;
            $id = isset( $this->post['id'] ) ? $this->post['id'] : "";
            if($id == ""){
                $Model = new Menu();
            }else{
                $Model = Menu::findOne($id);
            }
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
        $MenuModel = new Menu();
        $data = $MenuModel->tableList();
        $this->setData($data);
        $this->sendJson();
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
            $AdminUserModel = new Menu();
            $AdminUserModel->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }
}
