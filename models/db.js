/*
 * @Author: LiuOoCc
 * @Date: 2020-10-25 15:00:13
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-25 15:25:16
 * @FilePath: \多人社区\manyCommunities\models\db.js
 */
const mysql = require("mysql");
const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "123456",
  database: "cms",
});

exports.query = function (sqlStr) {
  return new Promise((resolve, reject) => {
    //从池子里面拿一个连接
    pool.getConnection((err, connection) => {
      if (err) return reject(err); //数据库连接失败！
      connection.query(sqlStr, (err, ...args) => {
        //操作结束尽早的释放连接
        connection.release();
        if (err) return reject(err);
        resolve(...args);
      });
    });
  });
};
