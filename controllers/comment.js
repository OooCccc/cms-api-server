/*
 * @Author: LiuOoCc
 * @Date: 2020-10-24 20:31:07
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-29 17:24:25
 * @FilePath: \多人社区\manyCommunities-E\controllers\comment.js
 */

const { query } = require("express");
const moment = require("moment");
const db = require("../models/db.js");
/**
 * 获取所有的评论信息
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.getAllComment = function (req, res, next) {};

/**
 * 获取一篇文章的所有评论信息
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.getOneComment = async function (req, res, next) {
  try {
    const { id } = req.params;
    let sqlStr = `select * from  comments where article_id=${id}`;
    const data = await db.query(sqlStr);
    res.status(200).json(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 添加评论
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.addComment = async function (req, res, next) {
  try {
    //从session中获取user_id
    const { content = "", article_id } = req.body;
    let sqlStr = `insert into comments(content,create_time,modify_time,article_id,user_id)
          values(
          '${content}',
          '${moment().format("YYYY-MM_DD hh:mm:ss")}',
          '${moment().format("YYYY-MM_DD hh:mm:ss")}',
          ${article_id},
          ${req.session.user.id}
          )`;
    let ret = await db.query(sqlStr);
    const [data] = await db.query(
      `select * from comments where id=${ret.insertId}`
    );
    res.status(201).json(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 修改评论信息
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.modComment = function (req, res, next) {};

/**
 * 删除评论
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.delComment = function (req, res, next) {};
