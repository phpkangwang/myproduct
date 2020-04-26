<?php
namespace frontend\controllers;

use common\models\GlobleConfig;
use Yii;
use yii\web\Controller;

/**
 * Site controller
 */
class SiteController extends Controller
{
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
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }

    public function actionIndex()
    {
        echo "aaaaqqqq";die;
        //return $this->render('index');
    }

    public function actionSendMail()
    {
        $mail= Yii::$app->mailer->compose();
        $mail->setTo('474021880@qq.com');
        $mail->setSubject("你的文档有新的通知");
//$mail->setTextBody('zheshisha ');   //发布纯文字文本
        $mail->setHtmlBody("你的文档有新的通知，快点过来查看啊");    //发布可以带html标签的文本
        if($mail->send())
            echo "success";
        else
            echo "failse";
        die();
    }

    private $FilePath = "image";
    /**
     *   上传文件
     */
    public function actionUploadFile()
    {
        $imgname = $_FILES['file']['name'];
        $imgnameArr = explode(".", $imgname);
        $imgname = date("Y_m_d_H_i_s", time()) . "_" . rand(10000, 99999) . "." . end($imgnameArr);
        $tmp = $_FILES['file']['tmp_name'];
        if (move_uploaded_file($tmp, $this->FilePath ."/". $imgname)) {
            $this->setData($imgname);
        } else {
        }
        $this->sendJson();
    }
}
