<?php
namespace backend\controllers;

use common\models\ErrorCode;
use common\models\MyException;
use common\models\NetMeeting;
use common\models\Product;

/**
 * Site controller
 */
class NetMeetingController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new NetMeeting();
	}

    public function actionAdd()
    {
        try {
            if (
                !isset($this->post['title']) ||
                !isset($this->post['date']) ||
                !isset($this->post['time']) ||
                !isset($this->post['linkText']) ||
                !isset($this->post['linkUrl'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $nation = $this->loginInfo['nation'];
            $location = isset($this->post['location']) ? $this->post['location'] : "";
            $topic = isset($this->post['topic']) ? $this->post['topic'] : "";
            $speaker = isset($this->post['speaker']) ? $this->post['speaker'] : "";
            $linkDesc = isset($this->post['linkDesc']) ? $this->post['linkDesc'] : "";
            $content = isset($this->post['content']) ? $this->post['content'] : "";

            $id = isset( $this->post['id'] ) ? $this->post['id'] : "";
            if($id == ""){
                $Model = new NetMeeting();
            }else{
                $Model =  NetMeeting::findOne($id);
                if( $this->loginInfo['role'] == 1 || $Model->nation == $this->loginInfo['nation']){
                }else{
                    throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
                }
            }

            $postData = array(
                'title' => $this->post['title'],
                'topic' => $topic,
                'speaker' => $speaker,
                'content' => $content,
                'location' => $location,
                'date' => $this->post['date'],
                'time' => $this->post['time'],
                'link_text' => $this->post['linkText'],
                'link_url' => $this->post['linkUrl'],
                'link_desc' => $linkDesc,
                'nation' => $nation,
                'create_time' => date("Y-m-d H:i:s",time()),
            );
             $Model->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }


    /**
     *   获取这个表的所有数据
     */
    public function actionTableList()
    {
        $Model = new NetMeeting();
        $data = $Model->tableList();
        $this->setData($data);
        $this->sendJson();
    }


    //分页获取数据
    public function actionPage()
    {
        try {
            if (
                !isset($this->get['pageNo']) ||
                !isset($this->get['pageSize'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $this->get['id'] = isset($this->get['id']) ? $this->get['id'] : "";
            $this->get['title'] = isset($this->get['title']) ? $this->get['title'] : "";
            $this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];

            $Model = new NetMeeting();
            $data = $Model->tablePage($this->get);
            $count = $Model->tableCount($this->get);
            $this->setData($data);
            $this->setPage(array(
                'pageNo' => $this->get['pageNo'],
                'maxPage' => ceil($count / $this->get['pageSize']),
                'count' => $count,
            ));
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }


    /**
     *  删除
     */
    public function actionDel()
    {
        try {
            if (
            !isset($this->get['id'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            //首先得判断是否有权限操作
            $obj = NetMeeting::findOne($this->get['id']);
            if( $this->loginInfo['role'] == 1 || $obj->nation == $this->loginInfo['nation']){
            }else{
                throw new MyException(ErrorCode::ERROR_OPERATE_LIMIT);
            }

            //删除数据
            $Model = new NetMeeting();
            $Model->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }
}
