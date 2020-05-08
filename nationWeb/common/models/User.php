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
class User extends BaseModel
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user';
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
        $this->create_time = date("Y-m-d H:i:s",time());
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
            return true;
        } catch (Exception $e) {
            echo $e->getMessage();
        }

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

		if ( isset($postData['id']) && $postData['id'] != "" ) {
			$where .= " and id = '{$postData['id']}'";
		}

		if ( isset($postData['name']) && $postData['name'] != "" ) {
			$where .= " and name = '{$postData['name']}'";
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

		if ( isset($postData['id']) && $postData['id'] != "" ) {
			$where .= " and id = '{$postData['id']}'";
		}

		if ( isset($postData['name']) && $postData['name'] != "" ) {
			$where .= " and name = '{$postData['name']}'";
		}
		return self::find()->where( $where )->count();
	}

}
