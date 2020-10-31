/*
 * @Author: LiuOoCc
 * @Date: 2020-10-24 17:05:15
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-27 11:21:04
 * @FilePath: \多人社区\manyCommunities-E\app.js
 */
const express = require("express");
const router = require("./router.js");
var bodyParser = require("body-parser");
const session = require("express-session");
const app = express();
const port = 10086;

//配置body-parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//配置sessin
app.use(
  session({
    secret: "LiuOoCc",
    resave: false,
    saveUninitialized: true,
  })
);

//挂载路由
app.use(router);

//全局错误处理
app.use((err, req, res, next) => {
  res.status(500).json({
    status: 500,
    error: err.message,
  });
});

app.listen(port, () => {
  console.log("10086 port is running!");
  console.log("please click link:http://127.0.0.1:10086");
});
