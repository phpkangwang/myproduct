<?php
namespace frontend\controllers;

use common\models\News;

/**
 * Site controller
 */
class NewsController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new News();
	}
}
