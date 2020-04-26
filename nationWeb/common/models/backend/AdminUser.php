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
class AdminUser extends BaseModel
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


}
