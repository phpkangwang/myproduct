<?php
namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * User model
 *
 * @property integer $id
 * @property string $username

 */
class BaseModel extends ActiveRecord
{

    public function add($data){
        foreach ($data as $key=>$val){
            $this->$key = $val;
        }
        if( $this->save()){
            return $this;
        }else{
            print_r($this->getFirstErrors());die;
            return false;
        }
    }

    public function findBase($id){
        return self::find()->where('id = :id', array(':id' =>$id))->asArray()->one();
    }

    /**
     *   获取这个表的所有信息
     */
    public function tableList()
    {
        return self::find()->asArray()->all();
    }

    /**
     * 删除
     * @param $id
     * @return int 删除的个数
     */
    public function del($id)
    {
        return self::deleteAll("id=:id",[':id'=>$id]);
    }
}