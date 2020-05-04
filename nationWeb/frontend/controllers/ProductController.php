<?php
namespace frontend\controllers;

use common\models\ErrorCode;
use common\models\MyException;
use common\models\Product;

/**
 * Site controller
 */
class ProductController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new Product();
	}
}
