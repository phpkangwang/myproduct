<?php
namespace backend\controllers;

use common\models\ErrorCode;
use common\models\MyException;
use common\models\User;

/**
 * Site controller
 */
class FrontendUserController extends MyController
{

	/**
	 *   用户注册
	 */
	public function actionUpdate()
	{
		try {
			if (
			!isset($this->post['id'])
			) {
				throw new MyException(ErrorCode::ERROR_PARAM);
			}
			$Obj = User::findOne($this->post['id']);
			if( empty($Obj)){
				throw new MyException(ErrorCode::ERROR_OBJ);
			}
			$postData = array();
			if( isset($this->post['name']) ){
				$postData['name'] = $this->post['name'];
			}
			if( isset($this->post['password']) ){
				$postData['password'] = $this->post['password'];
			}
			$Obj->add($postData);
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
            $Model = new User();
			$Model->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
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
			$this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];

			$Model = new User();
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
}
