<?php
namespace frontend\controllers;

use common\models\NetMeeting;

/**
 * Site controller
 */
class NetMeetingController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new NetMeeting();
	}
}
