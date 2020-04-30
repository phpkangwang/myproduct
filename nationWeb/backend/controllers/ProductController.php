<?php

namespace backend\controllers;

use common\models\ErrorCode;
use common\models\MyException;
use common\models\Product;

/**
 * Site controller
 */
class ProductController extends MyController
{
	public function actionAdd()
	{
		try {
			if (
				!isset( $this->post['name'] ) ||
				!isset( $this->post['description'] ) ||
				!isset( $this->post['menuId'] ) ||
				!isset( $this->post['image'] ) ||
				!isset( $this->post['data'] ) ||
				!isset( $this->post['content'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			$nation = $this->loginInfo['nation'];
			$id = isset( $this->post['id'] ) ? $this->post['id'] : "";
			if ( $id == "" ) {
				$Model = new Product();
			} else {
				$Model = Product::findOne( $id );
				if ( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation'] ) {
				} else {
					throw new MyException( ErrorCode::ERROR_OPERATE_LIMIT );
				}
			}

			$postData = array(
				'name' => $this->post['name'],
				'description' => $this->post['description'],
				'menu_id' => $this->post['menuId'],
				'image' => $this->post['image'],
				'data' => $this->post['data'],
				'content' => $this->post['content'],
				'nation' => $nation,
				'create_time' => date( "Y-m-d H:i:s", time() ),
			);
			$Model->add( $postData );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}

	public function actionUpdate()
	{
		try {
			if (
			!isset( $this->post['id'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			$Model = Product::findOne( $this->post['id'] );
			if ( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation'] ) {
			} else {
				throw new MyException( ErrorCode::ERROR_OPERATE_LIMIT );
			}
			$postData = $this->get;
			unset( $postData['token'] );
			$Model->add( $postData );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}

	/**
	 *    改变bannel显示状态
	 */
	public function actionUpdateStatus()
	{
		try {
			if (
			!isset( $this->get['id'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			$id = $this->get['id'];
			$obj = Product::findOne( $id );
			if ( empty( $obj ) ) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}

			if ( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation'] ) {
			} else {
				throw new MyException( ErrorCode::ERROR_OPERATE_LIMIT );
			}

			if ( $obj->status == 1 ) {
				$postData['status'] = 2;
			} else {
				$postData['status'] = 1;
			}
			$obj->add( $postData );
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
		$ProductModel = new Product();
		$data = $ProductModel->tableList();
		$this->setData( $data );
		$this->sendJson();
	}

	public function actionFindInfo()
	{
		try {
			if ( !isset( $this->get['id'] ) ) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			$ProductModel = new Product();
			$data = $ProductModel->findInfo($this->get['id']);
			$this->setData( $data );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}

	//分页获取数据
	public function actionPage()
	{
		try {
			if (
				!isset( $this->get['pageNo'] ) ||
				!isset( $this->get['pageSize'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			$this->get['id'] = isset( $this->get['id'] ) ? $this->get['id'] : "";
			$this->get['name'] = isset( $this->get['name'] ) ? $this->get['name'] : "";
			$this->get['menuId'] = isset( $this->get['menuId'] ) ? $this->get['menuId'] : "";
			$this->get['shelve'] = isset( $this->get['shelve'] ) ? $this->get['shelve'] : "";
			$this->get['recommend'] = isset( $this->get['recommend'] ) ? $this->get['recommend'] : "";
			$this->get['nation'] = isset( $this->get['nation'] ) ? $this->get['nation'] : $this->loginInfo['nation'];

			$ProductModel = new Product();
			$data = $ProductModel->tablePage( $this->get );
			$count = $ProductModel->tableCount( $this->get );
			$this->setData( $data );
			$this->setPage( array(
				'pageNo' => $this->get['pageNo'],
				'maxPage' => ceil( $count / $this->get['pageSize'] ),
				'count' => $count,
			) );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
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
			$obj = Product::findOne( $this->get['id'] );
			if ( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation'] ) {
			} else {
				throw new MyException( ErrorCode::ERROR_OPERATE_LIMIT );
			}

			//删除数据
			$Model = new Product();
			$Model->del( $this->get['id'] );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}
}
