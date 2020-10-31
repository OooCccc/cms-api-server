/*
 * @Author: LiuOoCc
 * @Date: 2020-10-27 14:56:21
 * @LastEditors: LiuOoCc
 * @LastEditTime: 2020-10-27 15:02:01
 * @FilePath: \多人社区\manyCommunities-E\utitls\sqlHelper.js
 */
exports.addCondition = (query) => {
  let str = ` 1=1 `;
  for (let key in query) {
    str += ` and ${key} ='${query[key]}' `;
  }
  return str;
};
