<?php
namespace frontend\controllers;

use common\models\SinglePage;

/**
 * Site controller
 */
class SinglePageController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new SinglePage();
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

			$data = $this->dataModel->tablePage($this->get);
			$count = $this->dataModel->tableCount($this->get);
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
