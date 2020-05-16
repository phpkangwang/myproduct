<?php
namespace frontend\controllers;

use common\models\AccessLog;
use common\models\ContactUs;
use common\models\ErrorCode;
use common\models\MyException;
use common\models\tool;
use common\models\User;

/**
 * Site controller
 */
class UserController extends MyController
{

    /**
     *   修改用户token
     */
    public function actionUpdateToken()
    {
        $id = $this->loginInfo['id'];
        $UserModel = new User();
        $UserModel->updateToken($id);
        $this->sendJson();
    }

    /**
     *   获取用户信息
     */
    public function actionUserInfo()
    {
        $this->setData($this->loginInfo);
        $this->sendJson();
    }

    /**
     *   用户注册
     */
    public function actionRegister()
    {
        try {
            if (!isset($this->get['email'])) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $email   = $this->get['email'];
			$job     = isset( $this->get['job'] ) ? $this->get['job'] : "";
			$country = isset( $this->get['country'] ) ? $this->get['country'] : "";
			$nick_name   = isset( $this->get['nickName'] ) ? $this->get['nickName'] : "";
            $UserModel = new User();
            $UserObj = $UserModel->findByName($email);
            if( !empty($UserObj)){
                throw new MyException(ErrorCode::ERROR_USER_EXIXTE);
            }
            //根据这个邮箱注册一个账号
            $password =rand(100000,999999);
            $postData = array(
                'name' => $email,
                'password' => $password,
				'job' => $job,
				'country' => $country,
				'nick_name' => $nick_name,
            );
            $UserModel->add($postData);
            //发送一封邮件
            $title = "请查看您的新消息";
            $content = "密码是:   ".$password;
            tool::sendMail($email,$title, $content);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    /**
     *   忘记密码
     */
    public function actionPasswordChange()
    {
        try {
            if (!isset($this->get['email'])) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $email = $this->get['email'];
            $UserModel = new User();
            $UserObj = $UserModel->findByName($email);
            if( empty($UserObj) ){
                throw new MyException(ErrorCode::ERROR_USER_NOT_EXIXTE);
            }
            //根据这个邮箱注册一个账号
            $password =rand(100000,999999);
            $postData = array(
                'name' => $email,
                'password' => $password,
            );
            $UserObj->add($postData);
            //发送一封邮件
            $title = "请查看您的账户".$email."密码";
            $content = "密码是:   ".$password;
            tool::sendMail($email,$title, $content);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

    public function actionContactUsAdd()
    {
        try {
            if (
                !isset($this->get['sex']) ||
                !isset($this->get['name']) ||
                !isset($this->get['job'])||
                !isset($this->get['email'])||
                !isset($this->get['region'])||
                !isset($this->get['country'])||
                !isset($this->get['message'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $postData['user_id'] = $this->loginInfo['id'];
            $postData['sex'] = $this->get['sex'];
            $postData['name'] = $this->get['name'];
            $postData['job'] = $this->get['job'];
            $postData['email'] = $this->get['email'];
            $postData['region'] = $this->get['region'];
            $postData['country'] = $this->get['country'];
            $postData['message'] = $this->get['message'];
            $ContactUsModel = new ContactUs();
            $ContactUsModel->add($postData);
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
            if ( !isset($this->get['email']) || !isset($this->get['password']) ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $name = $this->get['email'];
            $password = $this->get['password'];
            $UserModel = new User();
            $userObj = $UserModel->findByName($name);
            if( $password == $userObj['password']){
                $UserModel->updateToken($userObj['id']);
            }else{
                throw new MyException(ErrorCode::ERROR_USER_PASSWORD);
            }
            $userObj = $UserModel->findByName($name);
            $this->setData(['token'=>$userObj['token']]);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

	/**
	 * 访问日志
	 * Administrator 2020/5/7 21:45
	 */
    public function actionAccessLog()
	{
		try {
			if ( !isset($this->get['ip']) || !isset($this->get['nation']) ) {
				throw new MyException(ErrorCode::ERROR_PARAM);
			}
			//查看今天这个ip是否访问了，如果访问了就不添加记录了
			$AccessLogModel = new AccessLog();
			$obj = $AccessLogModel->findByIpDay($this->get['ip'], date("Y-m-d", time()) );
			if( !empty($obj)){
				$this->sendJson();
				return ;
			}

			$postData = array(
				'ip' => $this->get['ip'],
				'nation' => $this->get['nation'],
				'create_time' => date("Y-m-d H:i:s", time()),
				'create_day' => date("Y-m-d", time()),
			);

			$AccessLogModel->add($postData);
			$this->sendJson();
		} catch (MyException $e) {
			echo $e->toJson($e->getMessage());
		}

	}

}
