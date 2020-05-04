<?php
namespace frontend\controllers;

use common\models\File;


/**
 * Site controller
 */
class FileController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new File();
	}
}
