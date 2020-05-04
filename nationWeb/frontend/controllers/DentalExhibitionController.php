<?php
namespace frontend\controllers;

use common\models\DentalExhibition;

/**
 * Site controller
 */
class DentalExhibitionController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new DentalExhibition();
	}
}
