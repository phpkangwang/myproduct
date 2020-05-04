<?php
namespace frontend\controllers;

use common\models\AdminNation;

/**
 * Site controller
 */
class AdminNationController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new AdminNation();
	}

}
