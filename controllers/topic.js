/*
 * @Author: LiuOoCc
 * @Date: 2020-10-24 20:31:07
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-30 11:23:10
 * @FilePath: \多人社区\manyCommunities-E\controllers\topic.js
 */
const moment = require("moment");
const db = require("../models/db.js");
/**
 * 获取所有文章信息
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 *  _page 页码
 * _pageNum 文章显示数量
    https://www.cnblogs.com/hello-wei/p/10600071.html  (分页原理)

     1  0  10  不包括10
     2  10 20
     3  20 30  
    通过上面的分析，可以得出符合我们自己需求的分页sql格式是：select * from table limit (start-1)*limit,limit; 其中start是页码，limit是每页显示的条数。
     limit (_page-1)*_pageNum  , _pageNum

 */

exports.getAllTopic = async function (req, res, next) {
  try {
    // 获取页码和显示数量
    let { _page = 1, _pageNum = 20 } = req.query;
    let start = _page;
    let pageNum = _pageNum;
    //初始化页码
    start = start < 1 ? 1 : parseInt(start);
    pageNum = pageNum < 1 ? 1 : parseInt(pageNum);
    pageNum = pageNum > 20 ? 20 : parseInt(pageNum);
    let sqlStr = `select * from topics limit ${
      (start - 1) * pageNum
    }, ${pageNum}
    `;
    const count = await db.query(`select * from topics `);
    let countLength = count.length;
    const topicList = await db.query(sqlStr);
    res.status(200).json({ topicList, countLength });
  } catch (error) {
    next(error);
  }
};

/**
 * 获取一篇文章
 * @param {*} req
 * @param {*} res
 * @param {*} next
 */
exports.getOneTopic = async function (req, res, next) {
  try {
    let { id } = req.params;
    const sqlStr = `select * from topics where id=${id}`;
    const data = await db.query(sqlStr);
    res.status(200).json(data[0]);
  } catch (error) {
    next(error);
  }
};

/**
 * 添加文章
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 *
 */

exports.addTopic = async function (req, res, next) {
  try {
    //从session中获取user_id
    let { id } = req.session.user;
    const { title, content } = req.body;
    let sqlStr = `insert into topics(title,content,create_time,modify_time,user_id)
      values(
        '${title}',
        '${content}',
        '${moment().format("YYYY-MM-DD hh:mm:ss")}',
        '${moment().format("YYYY-MM-DD hh:mm:ss")}',
        '${id}') 
        `;

    let ret = await db.query(sqlStr);
    const [data] = await db.query(
      `select * from topics where id=${ret.insertId}`
    );
    res.status(201).json(data);
  } catch (error) {
    next(error);
  }
};

/**
 * 修改文章
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.modTopic = async function (req, res, next) {
  try {
    let { id } = req.params;
    let { title, content } = req.body;
    let sqlStr = `update topics set  
      title='${title}',
      content='${content}',
      modify_time='${moment().format("YYYY-MM-DD hh:mm:ss")}' where id=${id}  `;
    await db.query(sqlStr);
    const [modTopic] = await db.query(`select * from topics where id=${id}`);
    res.status(201).json(modTopic);
  } catch (error) {
    next(error);
  }
};

/**
 * 删除文章
 * @param {请求对象} req
 * @param {响应对象} res
 * @param {控制权} next
 */
exports.delTopic = async function (req, res, next) {
  try {
    //通过params获取文章id
    let { id } = req.params;
    let sqlStr = `
        delete  from topics  where id= ${id}
        `;
    await db.query(sqlStr);
    return res.status(200).json({});
  } catch (error) {
    next(error);
  }
};
