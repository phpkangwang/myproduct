<?php

namespace common\models;

use Yii;
use yii\base\Exception;

class DentalExhibition extends BaseModel
{

	/**
	 * {@inheritdoc}
	 */
	public static function tableName()
	{
		return 'dental_exhibition';
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
	 * 分页
	 * @return array
	 */
	public function tablePage( $postData )
	{
		$pageNo = $postData['pageNo'] < 1 ? 1 : $postData['pageNo'];
		$pageSize = $postData['pageSize'] < 1 || $postData['pageSize'] > 100 ? 8 : $postData['pageSize'];//默认一页8条数据
		$limit = $pageSize;
		$offset = ( $pageNo - 1 ) * $pageSize;
		$where = " 1";

		if ( isset($postData['title']) && $postData['title'] != "" ) {
			$where .= " and title like '%{$postData['title']}%'";
		}

		if ( isset($postData['nation']) && $postData['nation'] != "" ) {
			$where .= " and nation = '{$postData['nation']}'";
		}

		return self::find()->where( $where )->offset( $offset )->limit( $limit )->orderBy( 'id desc' )->asArray()->all();
	}

	/**
	 * 获取最大条数
	 * @param $postData
	 * @return bool|int|string|null
	 */
	public function tableCount( $postData )
	{
		$where = " 1";

		if ( isset($postData['title']) && $postData['title'] != "" ) {
			$where .= " and title like '%{$postData['title']}%'";
		}

		if ( isset($postData['nation']) && $postData['nation'] != "" ) {
			$where .= " and nation = '{$postData['nation']}'";
		}
		return self::find()->where( $where )->count();
	}


}
