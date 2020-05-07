<?php
namespace common\models\backend;

use common\models\BaseModel;
use Yii;
use yii\base\Exception;

/**
 * User model
 *
 * @property integer $id
 * @property string $username

 */
class   AdminUser extends BaseModel
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return '{{%admin_user}}';
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
            [[ 'name'], 'required'],
        ];
    }

    public function add($data){
        foreach ($data as $key=>$val){
            $this->$key = $val;
        }
        if( $this->save()){
            return $this;
        }else{
            Yii::$app->getSession()->setFlash('error', '系统错误');
            return false;
        }
    }

    public function findByName($name){
        return self::find()->where('name = :name', array(':name' =>$name))->one();
    }

    /**
     *   初始化一下用户的token
     */
    public function updateToken($id)
    {
        try {
            $token = base64_encode(
                json_encode(array(
                    'id' => $id,
                    'time' => time()
                ))
            );
            $obj = self::findOne($id);
            if ( empty($obj)){
                throw new Exception(ErrorCode::ERROR_TOKEN );
            }
            $obj->add(['token'=>$token]);
            return $token;
        } catch (Exception $e) {
            echo $e->getMessage();
        }

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

		if( isset($postData['id']) && $postData['id'] != ""){
			$where .= " and id = '{$postData['id']}'";
		}

		if( isset($postData['name']) && $postData['name'] != ""){
			$where .= " and name like '%{$postData['name']}%'";
		}

		if( isset($postData['nickName']) && $postData['nickName'] != ""){
			$where .= " and nick_name = '{$postData['nickName']}'";
		}

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

		if( isset($postData['id']) && $postData['id'] != ""){
			$where .= " and id = '{$postData['id']}'";
		}

		if( isset($postData['name']) && $postData['name'] != ""){
			$where .= " and name like '%{$postData['name']}%'";
		}

		if( isset($postData['nickName']) && $postData['nickName'] != ""){
			$where .= " and nick_name = '{$postData['nickName']}'";
		}

		if( isset($postData['nation']) && $postData['nation'] != ""){
			$where .= " and nation = '{$postData['nation']}'";
		}
		return self::find()->where($where)->count();
	}
}
