<?php

namespace backend\controllers;

use common\models\backend\BackendConfig;
use common\models\ErrorCode;
use common\models\MyException;

/**
 * Site controller
 */
class BackendConfigController extends MyController
{
	public function actionAdd()
	{
		try {
			if (
				!isset( $this->post['name'] ) ||
				!isset( $this->post['value'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			$nation = $this->loginInfo['nation'];
			$id = isset( $this->post['id'] ) ? $this->post['id'] : "";
			if ( $id == "" ) {
				$Model = new BackendConfig();
			} else {
				$Model = BackendConfig::findOne( $id );
				if ( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation'] ) {
				} else {
					throw new MyException( ErrorCode::ERROR_OPERATE_LIMIT );
				}
			}

			$postData = array(
				'name' => $this->post['name'],
				'value' => $this->post['value'],
				'nation' => $nation,
			);
			$Model->add( $postData );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}

	/**
	 *   获取这个表的所有数据
	 */
	public function actionTableList()
	{
		$Model = new BackendConfig();
		$data = $Model->tableList();
		$this->setData( $data );
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
			$this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];

			$Model = new BackendConfig();
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
			!isset( $this->get['id'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			//首先得判断是否有权限操作
			$obj = BackendConfig::findOne( $this->get['id'] );
			if( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation']){
			}else{
				throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
			}

			//删除数据
			$Model = new BackendConfig();
			$Model->del( $this->get['id'] );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}
}
