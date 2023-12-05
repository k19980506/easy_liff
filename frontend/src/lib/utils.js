/**
 * @author Caleb
 * @description 數字取四捨五入到第n位
 * @param {Number} num 要四捨五入的數字
 * @param {Number} n 取小數點到第n位
 * @returns {Number}
 */
export const round = (num, n = 2) => {
  return +(Math.round(num + `e+${n}`)  + `e-${n}`)
}