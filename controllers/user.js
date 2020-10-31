/*
 * @Author: LiuOoCc
 * @Date: 2020-10-24 20:31:07
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-30 12:37:09
 * @FilePath: \多人社区\manyCommunities-E\controllers\user.js
 */
const md5 = require("blueimp-md5");
const moment = require("moment");
const db = require("../models/db.js");
const sqlHelper = require("../utitls/sqlHelper.js");

/**
 * 获取所有的用户信息
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.getAllUser = async function (req, res, next) {
  const query = sqlHelper.addCondition(req.query);
  let sqlStr = `select * from users where ${query}`;
  try {
    let userList = await db.query(sqlStr);
    return res.status(200).json(userList);
  } catch (error) {
    next(error);
  }
  //返回数据展示
};

/**
 * 添加用户
 */
exports.addUser = async function (req, res, next) {
  const body = req.body;
  const sqlStr = `INSERT INTO users(username,password,email,nickname,avatar,gender,create_time,modify_time)
        VALUES (
            '${body.nickname}',
            '${md5(md5(body.password))}',
            '${body.email}',
            '${body.nickname}',
            'default-avatar.png',
            0,
            '${moment().format("YYYY-MM-DD hh:mm:ss")}',
            '${moment().format("YYYY-MM-DD hh:mm:ss")}'
        )`;

  try {
    let data = await db.query(sqlStr);
    let result = await db.query(
      `select * from users where id=${data.insertId}`
    );
    return res.status(201).json(result[0]);
  } catch (error) {
    next(error);
  }
};
/**
 * 修改用户信息
 */
exports.modUser = async function (req, res, next) {};

/**
 * 删除用户信息
 */
exports.delUser = async function (req, res, next) {
  try {
    let { id } = req.params;
    let sqlStr = `delete  from users where id=${id}`;
    await db.query(sqlStr);
    return res.status(200).json({});
  } catch (error) {
    next(error);
  }
};
