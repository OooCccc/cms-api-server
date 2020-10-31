/*
 * @Author: LiuOoCc
 * @Date: 2020-10-24 20:31:07
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-30 12:19:58
 * @FilePath: \多人社区\manyCommunities-E\controllers\session.js
 */

const db = require("../models/db.js");
const md5 = require("blueimp-md5");

/**
 * 获取登陆状体
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.getSession = function (req, res, next) {
  if (!req.session.user)
    return res.status(404).json({ status: 404, message: "未授权！" });
  res.status(200).json(req.session.user);
};

/**
 * 创建会话
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.addSession = async function (req, res, next) {
  //接受表单数据
  //操作数据库登陆请求
  //发送响应
  try {
    const body = req.body;

    body.password = md5(md5(body.password));
    let sqlStr = `select * from users where email='${body.email}' and password = '${body.password}'`;
    let data = await db.query(sqlStr);
    if (!data[0])
      return res.status(404).json({
        status: 404,
        message: "用户名或密码错误！",
      });
    req.session.user = data[0];
    return res.status(200).json(data[0]);
  } catch (error) {
    next(error);
  }
};

/**
 * 删除会话
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.delSeesion = function (req, res, next) {
  req.session.user = null;
  res.status(200).json({});
};
