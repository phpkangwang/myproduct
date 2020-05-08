<?php
namespace common\models;

use Yii;
use yii\base\Exception;

/**
 * User model
 *
 * @property integer $id
 * @property string $username

 */
class Menu extends BaseModel
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'menu';
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

    public function findByParentId($parentId,$nation){
        return self::find()->where(['parent_id'=>$parentId])->andWhere(['nation'=>$nation])->asArray()->orderBy('sort desc')->all();
    }

	/**
	 * 分页
	 * @return array
	 */
	public function tablePage($postData)
	{
		$pageNo   = $postData['pageNo'] < 1 ? 1 : $postData['pageNo'];
		$pageSize = $postData['pageSize'] < 1 || $postData['pageSize'] > 100 ? 8 : $postData['pageSize'];//默认一页8条数据
		$limit    = $pageSize;
		$offset   = ($pageNo-1)*$pageSize;
		$where = " 1";

		if( isset($postData['nation']) && $postData['nation'] != ""){
			$where .= " and nation = '{$postData['nation']}'";
		}

		return self::find()->where($where)->offset($offset)->limit($limit)->orderBy('id desc')->asArray()->all();
	}

	/**
	 *  获取最大条数
	 */
	public function tableCount($postData)
	{
		$where = " 1";


		if( isset($postData['nation']) && $postData['nation'] != ""){
			$where .= " and nation = '{$postData['nation']}'";
		}
		return self::find()->where($where)->count();
	}

	/**
	 * 获取菜单这个国家的最大uid
	 * @param $nation
	 * @return int|mixed
	 * Administrator 2020/5/7 20:57
	 */
	public function findMaxUid($nation)
	{
		$obj = self::find()->where(['nation' => $nation])->orderBy('uid desc')->asArray()->one();
		if( empty($obj)) {
			return 1;
		}else{
			return $obj['uid']+1;
		}
	}
}
