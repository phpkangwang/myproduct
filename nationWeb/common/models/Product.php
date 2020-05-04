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
        if( isset($postData['id']) && $postData['id'] != ""){
            $where .= " and product.id = '{$postData['id']}'";
        }

        if( isset($postData['name']) && $postData['name'] != ""){
            $where .= " and product.name like '%{$postData['name']}%'";
        }

        if( isset($postData['shelve']) && $postData['shelve'] != ""){
            $where .= " and product.shelve = '{$postData['shelve']}'";
        }

        if( isset($postData['recommend']) && $postData['recommend'] != ""){
            $where .= " and product.recommend = '{$postData['recommend']}'";
        }

        if( isset($postData['nation']) && $postData['nation'] != ""){
            $where .= " and nation = '{$postData['nation']}'";
        }

        if( isset($postData['menuId']) && $postData['menuId'] != ""){
            $where .= " and menu_id = '{$postData['menuId']}'";
        }

		if( isset($postData['parentMenuId']) && $postData['parentMenuId'] != ""){
			//查到这个菜单的所有下级菜单
			$MenuModel = new Menu();
			$MenuObjs = $MenuModel->findByParentId($postData['parentMenuId']);
			if( empty($MenuObjs) ){
				$where .= " and menu_id = {$postData['parentMenuId']}";
			}else{
				$MenuIdArr = array_column($MenuObjs,'id');
				$inStr = "'" . implode("','", $MenuIdArr) . "'";
				$where .= " and menu_id in ({$inStr})";
			}

		}
        return self::find()->joinWith('menu')->where($where)->offset($offset)->limit($limit)->orderBy('id desc')->asArray()->all();
    }


    /**
     *  获取最大条数
     */
    public function tableCount($postData)
    {
        $where = " 1";
		if( isset($postData['id']) && $postData['id'] != ""){
			$where .= " and product.id = '{$postData['id']}'";
		}

		if( isset($postData['name']) && $postData['name'] != ""){
			$where .= " and product.name like '%{$postData['name']}%'";
		}

		if( isset($postData['shelve']) && $postData['shelve'] != ""){
			$where .= " and product.shelve = '{$postData['shelve']}'";
		}

		if( isset($postData['recommend']) && $postData['recommend'] != ""){
			$where .= " and product.recommend = '{$postData['recommend']}'";
		}

		if( isset($postData['nation']) && $postData['nation'] != ""){
			$where .= " and nation = '{$postData['nation']}'";
		}

		if( isset($postData['menuId']) && $postData['menuId'] != ""){
			$where .= " and menu_id = '{$postData['menuId']}'";
		}

		if( isset($postData['parentMenuId']) && $postData['parentMenuId'] != ""){
			//查到这个菜单的所有下级菜单
			$MenuModel = new Menu();
			$MenuObjs = $MenuModel->findByParentId($postData['parentMenuId']);
			if( empty($MenuObjs) ){
				$where .= " and menu_id = {$postData['parentMenuId']}";
			}else{
				$MenuIdArr = array_column($MenuObjs,'id');
				$inStr = "'" . implode("','", $MenuIdArr) . "'";
				$where .= " and menu_id in ({$inStr})";
			}

		}
        return self::find()->where($where)->count();
    }
}
