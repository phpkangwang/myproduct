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

	public function findByNation( $nation )
	{
		return self::find()->where( [ 'nation' => $nation ] )->one();
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


	/**
	 * 复制默认数据到指定国家
	 * @param $nation
	 * @return bool
	 * @throws \yii\db\Exception
	 * Administrator 2020/4/30 19:39
	 */
	public function copyDefaultToNation( $nation )
	{
		$obj = self::findByNation( $nation );
		if( $obj == ""){
			$table = self::tableName();
			$colums = self::attributes();
			$insertColumn = array();
			$selectColumn = array();
			foreach ($colums as $val){
				if( $val != "id"){
					array_push($insertColumn, $val);
					if($val == "nation"){
						array_push($selectColumn, $nation);
					}else{
						array_push($selectColumn, $val);
					}
				}
			}
			$insertColumnStr = implode(",",$insertColumn);
			$selectColumn = implode(",",$selectColumn);

			$sql = "
            insert into {$table} (
                    {$insertColumnStr}
            )SELECT
            {$selectColumn}
            FROM
            {$table}
            WHERE nation = 1
        ";
			Yii::$app->db->createCommand( $sql )->query();
		}
		return true;
	}
}
