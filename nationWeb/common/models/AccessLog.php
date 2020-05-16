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
	 * 根据ip和时间查找数据
	 * @param $ip
	 * @param $day
	 * @return array|\yii\db\ActiveRecord|null
	 * Administrator 2020/5/16 20:46
	 */
    public function findByIpDay($ip,$day)
	{
		return self::find()->where(['ip'=>$ip])->andWhere(['nation'=>$day])->asArray()->one();
	}


	/**
	 * 根据 今日 昨日  本月  上月
	 * Administrator 2020/5/7 21:56
	 */
    public function accessInfo( $sday, $eday )
	{
		$time = time();
		$stoday = date("Y-m-d", $time);
		$etoday = date("Y-m-d", $time + 86400);
		$syeday = date("Y-m-d", $time - 86400);
		$eyeday = date("Y-m-d", $time);
		$monthSday = "";//这个月的开始时间
		$monthEday = "";//这个月的结束时间
		tool::monthSdayEday($monthSday, $monthEday);

		$lastMonthSday = "";//这个月的开始时间
		$lastMonthEday = "";//这个月的结束时间
		tool::lastMonthSdayEday($lastMonthSday, $lastMonthEday);

		$rs['sum']['today'] = self::find()->where('create_time >= :stime and create_time <= :etime',array(':stime'=>$stoday,':etime'=>$etoday))->groupBy('ip')->count();
		$rs['sum']['yesterday'] = self::find()->where('create_time >= :stime and create_time <= :etime',array(':stime'=>$syeday,':etime'=>$eyeday))->groupBy('ip')->count();
		$rs['sum']['nowMonth'] = self::find()->where('create_time >= :stime and create_time <= :etime',array(':stime'=>$monthSday,':etime'=>$monthEday))->groupBy('ip')->count();
		$rs['sum']['lastMonth'] = self::find()->where('create_time >= :stime and create_time <= :etime',array(':stime'=>$lastMonthSday,':etime'=>$lastMonthEday))->groupBy('ip')->count();

		$rs['list'] = self::find()->select('create_day as day,count(ip) as num')->where('create_time >= :stime and create_time <= :etime',array(':stime'=>$sday,':etime'=>$eday))->groupBy('create_day')->asArray()->all();

		return $rs;

	}
}
