<?php
namespace backend\controllers;

use common\models\backend\AdminUser;
use common\models\ErrorCode;
use common\models\MyException;

/**
 * Site controller
 */
class UserController extends MyController
{

    /**
     *   获取用户信息
     */
    public function actionUserInfo()
    {
        $this->setData($this->loginInfo);
        $this->sendJson();
    }

    /**
     *   获取这个表的所有数据
     */
    public function actionTableList()
    {
        $MenuModel = new AdminUser();
        $data = $MenuModel->tableList();
        $this->setData($data);
        $this->sendJson();
    }

    /**
     *   用户注册
     */
    public function actionAdd()
    {
        try {
            if ( !isset($this->post['name']) ||
                 !isset($this->post['nickName']) ||
                 !isset($this->post['password']) ||
                 !isset($this->post['role']) ||
                 !isset($this->post['nation'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $postData = array(
                'name' => $this->post['name'],
                'nick_name' => $this->post['nickName'],
                'password' => $this->post['password'],
                'role' => $this->post['role'],
                'create_time' => date("Y-m-d H:i:s",time()),
            );
            $AdminUserModel = new AdminUser();
            $AdminUserModel->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *   用户注册
     */
    public function actionUpdate()
    {
        try {
            if (
                !isset($this->post['id']) ||
                !isset($this->post['name']) ||
                !isset($this->post['nickName']) ||
                !isset($this->post['role'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $Obj = AdminUser::findOne($this->post['id']);
            if( empty($Obj)){
                throw new MyException(ErrorCode::ERROR_OBJ);
            }
            $postData = array(
                'name' => $this->post['name'],
                'nick_name' => $this->post['nickName'],
                'role' => $this->post['role'],
            );
            $Obj->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *   登陆
     */
    public function actionLogin()
    {
        try {
            if ( !isset($this->get['name']) || !isset($this->get['password']) ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $name = $this->get['name'];
            $password = $this->get['password'];
            $AdminUserModel = new AdminUser();
            $userObj = $AdminUserModel->findByName($name);
            if( $password == $userObj['password']){
                $token = $AdminUserModel->updateToken($userObj['id']);
            }else{
                throw new MyException(ErrorCode::ERROR_USER_PASSWORD);
            }
            $this->setData(['token'=>$token]);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *   登出
     */
    public function actionLoginOut()
    {
        try {
            $AdminUserModel = new AdminUser();
            $userObj = $AdminUserModel->findByName($this->loginInfo['id']);
            $postData = array(
                'token' => "",
            );
            $userObj->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *  删除账号
     */
    public function actionDel()
    {
        try {
            if (
                !isset($this->get['id'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $AdminUserModel = new AdminUser();
            $AdminUserModel->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *   获取用户信息
     */
    public function actionLoginInfo()
    {
        $obj = $this->loginInfo;
        unset($obj['password']);
        $this->setData($obj);
        $this->sendJson();
    }


    private $FilePath = "image";
    /**
     *   上传文件
     */
    public function actionUploadFile()
    {
        $imgname = $_FILES['file']['name'];
        $imgnameArr = explode(".", $imgname);
        $imgname = date("YmdHis", time()) . "_" . rand(10000, 99999) . "." . end($imgnameArr);
        $tmp = $_FILES['file']['tmp_name'];
        if (move_uploaded_file($tmp, $this->FilePath ."/". $imgname)) {
            $this->setData($imgname);
        } else {
        }
        $this->sendJson();
    }
}
