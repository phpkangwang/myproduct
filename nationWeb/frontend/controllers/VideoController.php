<?php

namespace frontend\controllers;

use common\models\Video;

/**
 * Site controller
 */
class VideoController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new Video();
	}
}
