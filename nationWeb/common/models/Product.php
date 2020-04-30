<?php
namespace common\models;

use Yii;
use yii\base\Exception;

class Product extends BaseModel
{

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
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
     *  与菜单 关系
     * @return \yii\db\ActiveQuery
     */
    public function getMenu()
    {
        return $this->hasOne(Menu::className(), ['id' => 'menu_id'])->select('id,name');
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
        if( $postData['id'] != ""){
            $where .= " and product.id = '{$postData['id']}'";
        }

        if( $postData['name'] != ""){
            $where .= " and product.name like '%{$postData['name']}%'";
        }

        if( $postData['shelve'] != ""){
            $where .= " and product.shelve = '{$postData['shelve']}'";
        }

        if( $postData['recommend'] != ""){
            $where .= " and product.recommend = '{$postData['recommend']}'";
        }

        if( $postData['nation'] != ""){
            $where .= " and nation = '{$postData['nation']}'";
        }

        if( $postData['menuId'] != ""){
            $where .= " and menu_id = '{$postData['menuId']}'";
        }
        return self::find()->joinWith('menu')->where($where)->offset($offset)->limit($limit)->orderBy('id desc')->asArray()->all();
    }

	/**
	 * 查询详情，如果有菜单，就把下级菜单显示出来
	 * @param $id
	 * @return array
	 * Administrator 2020/4/30 20:03
	 */
    public function findInfo($id)
	{
		try {
			$productArr = array();
			$obj = self::find()->where(['id'=>$id])->asArray()->one();
			array_push($productArr, $obj);
			if( $obj == ""){
				throw new MyException( ErrorCode::ERROR_OBJ );
			}
			if( $obj['menu_id'] != ""){
				//查到这个菜单的所有下级菜单
				$MenuModel = new Menu();
				$MenuObjs = $MenuModel->findByParentId($obj['menu_id']);
				$sonMenuIdArr = array_column($MenuObjs,'id');
				if(!empty($sonMenuIdArr)){
					$sonProduct = self::find()->where(['in','menu_id',$sonMenuIdArr])->andWhere(['nation'=>$obj['nation']])->asArray()->all();
					$productArr = array_merge($productArr,$sonProduct);
				}
			}
			return $productArr;
		} catch ( MyException $e ) {
			echo $e->toJson( $e->getMessage() );
		}

	}

    /**
     *  获取最大条数
     */
    public function tableCount($postData)
    {
        $where = " 1";
        if( $postData['id'] != ""){
            $where .= " and id = '{$postData['id']}'";
        }

        if( $postData['name'] != ""){
            $where .= " and product.name like '%{$postData['name']}%'";
        }

        if( $postData['shelve'] != ""){
            $where .= " and product.shelve = '{$postData['shelve']}'";
        }

        if( $postData['recommend'] != ""){
            $where .= " and product.recommend = '{$postData['recommend']}'";
        }

        if( $postData['nation'] != ""){
            $where .= " and nation = '{$postData['nation']}'";
        }

        if( $postData['menuId'] != ""){
            $where .= " and menu_id = '{$postData['menuId']}'";
        }
        return self::find()->where($where)->count();
    }
}
