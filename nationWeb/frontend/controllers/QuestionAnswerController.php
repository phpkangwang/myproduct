<?php
namespace frontend\controllers;

use common\models\QuestionAnswer;

/**
 * Site controller
 */
class QuestionAnswerController extends MyController
{

	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new QuestionAnswer();
	}

}
