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
}
