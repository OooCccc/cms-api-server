/*
 * @Author: LiuOoCc
 * @Date: 2020-10-24 20:17:10
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-29 17:07:59
 * @FilePath: \多人社区\manyCommunities-E\router.js
 */
const express = require("express");
var router = express.Router();
//引入controllers
const user = require("./controllers/user.js");
const session = require("./controllers/session.js");
const topic = require("./controllers/topic.js");
const comments = require("./controllers/comment.js");
const db = require("./models/db.js");

/**
 * 路由中间件
 * 验证用户权限
 */
function checkLogin(req, res, next) {
  if (!req.session.user)
    return res.status(401).json({ status: 404, message: "未授权！请登陆" });
  next();
}

/**
 * 话题校验
 */
async function checkTopic(req, res, next) {
  try {
    // 通过params获取文章id;
    let { id } = req.params;
    const [topic] = await db.query(`select * from  topics where id=${id}`);
    if (topic == undefined) {
      return res.status(404).json({ status: 404, message: "资源不存在！!" });
    }
    if (req.session.user["id"] !== topic.user_id) {
      return res.status(404).json({
        status: 404,
        message: "资源不存在！",
      });
    }
    next();
  } catch (error) {
    next(error);
  }
}
/**
 * 用户资源处理
 */
router
  .get("/user", user.getAllUser)
  .post("/user", user.addUser)
  .patch("/user/:id", user.modUser)
  .delete("/user/:id", user.delUser);

/**
 * 话题资源处理
 */

router
  .get("/topics", topic.getAllTopic)
  .get("/topics/:id", topic.getOneTopic)
  .post("/topics", checkLogin, topic.addTopic)
  .patch("/topics/:id", checkLogin, checkTopic, topic.modTopic)
  .delete("/topics/:id", checkLogin, checkTopic, topic.delTopic);

/**
 * 评论资源处理
 */

router
  .get("/comments/:id", comments.getOneComment)
  .get("/comments", comments.getAllComment)
  .post("/comments", checkLogin, comments.addComment)
  .patch("/comments/:id", comments.modComment)
  .delete("/comments/:id", comments.delComment);

/**
 * 会话管理
 */

router
  .get("/session", session.getSession)
  .post("/session", session.addSession)
  .delete("/session", session.delSeesion);

module.exports = router;
