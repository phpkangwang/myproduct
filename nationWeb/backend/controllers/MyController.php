<?php
namespace backend\controllers;

use common\models\backend\AdminUser;
use common\models\ErrorCode;
use common\models\MyException;
use Yii;
use yii\web\Controller;

/**
 * Site controller
 */
class MyController extends Controller
{
    public $post;
    public $get;
	public $dataModel;
    /**
     * @var array 存放用户登录信息
     */
    public $loginInfo = array();
    /**
     * @var 返回的错误码 默认返回200
     */
    private $code=200;

    /**
     * @var 数据
     */
    private $data="";

    /**
     * @var 分页
     */
    private $page="";

    /**
     * 免除角色权益限制访问的功能
     * @var array
     */
    private $NoAccessLimit = [
        'user/login',
        'user/upload-file',
    ];

    public function __construct($id,  $module,  $config = [])
    {
        $this->post = Yii::$app->request->post();
        $this->get = Yii::$app->request->get();
        //获取token信息
        $this->checkToken();
        parent::__construct($id, $module, $config);
    }

    public function checkToken()
    {
        try{
            //部分地址可以不用token
            $route = Yii::$app->requestedRoute;
            if( in_array($route, $this->NoAccessLimit))
            {
                return true;
            }

            $token = isset( $this->get['token'] ) ? $this->get['token'] : "";
            $tokenArr = json_decode( base64_decode($token),true );
            $AdminUserModel = new AdminUser();
            if( !isset($tokenArr['id']) ){
                throw new MyException(ErrorCode::ERROR_TOKEN);
            }
            $obj = $AdminUserModel->findBase($tokenArr['id']);
            //判断当前的token和数据库里面的token是否一致
            if( empty($obj) || $token != $obj['token']  ){
                throw new MyException(ErrorCode::ERROR_TOKEN);
            }
            $this->loginInfo = $obj;
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }

    }

	//分页获取数据
	public function actionFindObj()
	{
		try {
			if (
			!isset($this->get['id'])
			) {
				throw new MyException(ErrorCode::ERROR_PARAM);
			}
			$data = $this->dataModel->findBase($this->get['id']);
			$this->setData($data);
			$this->sendJson();
		} catch (MyException $e) {
			echo $e->toJson($e->getMessage());
		}
	}

    public function setCode($code)
    {
        $this->code = $code;
    }

    public function setData($data)
    {
        $this->data = $data;
    }

    public function setPage($page)
    {
        $this->page = $page;
    }

    public function sendJson()
    {
        header('content-type:application/json');

        echo json_encode(
            array(
                'code' => $this->code,
                'data' => $this->data,
                'page' => $this->page
            )
        );
        die;
    }
}
