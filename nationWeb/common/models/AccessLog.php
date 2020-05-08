<?php
namespace common\models;

use Yii;
use yii\base\Exception;

class AccessLog extends BaseModel
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'access_log';
    }

    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [

        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
        ];
    }

	/**
	 * 根据 今日 昨日  本月  上月
	 * Administrator 2020/5/7 21:56
	 */
    public function getList()
	{
		$time = time();
		$stoday = date("Y-m-d", $time);
		$etoday = date("Y-m-d", $time + 86400);
		$syeday = date("Y-m-d", $time - 86400);
		$eyeday = date("Y-m-d", $time);
		$rs['today'] = self::find()->where('create_time > :stime and create_time < :etime',array(':stime'=>$stoday,':etime'=>$etoday))->groupBy('ip')->sum();
		$rs['yesterday'] = self::find()->where('create_time > :stime and create_time < :etime',array(':stime'=>$syeday,':etime'=>$eyeday))->groupBy('ip')->sum();

	}
}
