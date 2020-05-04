<?php
namespace frontend\controllers;

use common\models\Menu;

/**
 * Site controller
 */
class MenuController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new Menu();
	}
}
