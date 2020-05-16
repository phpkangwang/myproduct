<?php
namespace backend\controllers;

use common\models\AdminNation;
use common\models\ErrorCode;
use common\models\MyException;
use common\models\QuestionAnswer;

/**
 * Site controller
 */
class QuestionAnswerController extends MyController
{
	public function __construct( $id, $module, $config = [] )
	{
		parent::__construct( $id, $module, $config );
		$this->dataModel = new QuestionAnswer();
	}

    /**
     *   获取这个表的所有数据
     */
    public function actionTableList()
    {
        $Model = new QuestionAnswer();
        $data = $Model->tableList();
        $this->setData($data);
        $this->sendJson();
    }

    /**
     *   添加
     */
    public function actionAdd()
    {
        try {
            if (
                !isset($this->post['question']) ||
                !isset($this->post['answer'])
            ) {
                throw new MyException(ErrorCode::ERROR_PARAM);
            }
            $id = isset( $this->post['id'] ) ? $this->post['id'] : "";
            if($id == ""){
                $Model = new QuestionAnswer();
            }else{
                $Model =  QuestionAnswer::findOne($id);
            }
            $postData = array(
                'question' => $this->post['question'],
                'answer' => $this->post['answer'],
                'create_time' => date("Y-m-d H:i:s",time()),
            );
            $Model->add($postData);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
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
            $this->get['question'] = isset($this->get['question']) ? $this->get['question'] : "";
            $this->get['answer'] = isset($this->get['answer']) ? $this->get['answer'] : "";
            $this->get['nation'] = isset($this->get['nation']) ? $this->get['nation'] : $this->loginInfo['nation'];

            $Model = new QuestionAnswer();
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
            $Model = new QuestionAnswer();
            $Model->del($this->get['id']);
            $this->sendJson();
        } catch (MyException $e) {
            echo $e->toJson($e->getMessage());
        }
    }

}
