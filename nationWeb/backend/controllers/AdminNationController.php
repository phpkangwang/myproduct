<?php

namespace backend\controllers;

use common\models\AdminNation;
use common\models\DentalExhibition;
use common\models\ErrorCode;
use common\models\File;
use common\models\Menu;
use common\models\MyException;
use common\models\NetMeeting;
use common\models\News;
use common\models\Product;
use common\models\QuestionAnswer;
use common\models\SinglePage;
use common\models\Video;
use common\models\WebFoot;

/**
 * Site controller
 */
class AdminNationController extends MyController
{

	/**
	 *   获取这个表的所有数据
	 */
	public function actionTableList()
	{
		$Model = new AdminNation();
		$data = $Model->tableList();
		$this->setData( $data );
		$this->sendJson();
	}

	/**
	 *   添加
	 */
	public function actionAdd()
	{
		try {
			if ( !isset( $this->post['nation'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			$id = isset( $this->post['id'] ) ? $this->post['id'] : "";
			if ( $id == "" ) {
				$Model = new AdminNation();
			} else {
				$Model = AdminNation::findOne( $id );
			}
			$postData = array(
				'nation' => $this->post['nation'],
			);
			$Model->add( $postData );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}

	/**
	 *  删除
	 */
	public function actionDel()
	{
		try {
			if (
			!isset( $this->get['id'] )
			) {
				throw new MyException( ErrorCode::ERROR_PARAM );
			}
			//这个方法不允许使用
			throw new MyException( ErrorCode::ERROR_OPERATE_LIMIT );

			$Model = new AdminNation();
			$Model->del( $this->get['id'] );
			$this->sendJson();
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}
	}

	/**
	 * 复制默认国家数据到指定国家数据
	 * @param $nation
	 */
	public function actionCopyDefaultToNation( $nation )
	{
		$models = array(
			new Menu(),
			new DentalExhibition(),
			new File(),
			new NetMeeting(),
			new News(),
			new Product(),
			new QuestionAnswer(),
			new SinglePage(),
			new Video(),
			new WebFoot(),
		);
		foreach ($models as $model){
			$model->copyDefaultToNation( $nation );
		}
		$this->sendJson();
	}

}
