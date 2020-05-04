<?php
namespace frontend\controllers;

use common\models\WebFoot;

/**
 * Site controller
 */
class WebFootController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new WebFoot();
	}
}
