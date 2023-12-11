import Swal from 'sweetalert2'

/**
 * @author Caleb
 * @description 取的準確的資料類型
 * @param {*} any
 * @returns {String} 類型
 */
export const getType = (any) => {
  const stringType = Object.prototype.toString.call(any)
  const regexp = /[\s]{1}([A-Z|a-z]*)(?=\])/
  const res = stringType.match(regexp)
  return res[1]
}

/**
 * @author Caleb
 * @description 判斷東西是否為空
 * @param {*} value
 * @returns {Boolean}
 */
export const isEmpty = (value) => {
  if ([null, undefined].includes(value)) return true
  const type = getType(value)

  switch (type) {
    case 'Array':
    case 'String':
      if (value.length > 0) return false
      return true
    case 'Object':
      for (const key in value) {
        if (hasOwnProperty.call(value, key)) return false
      }
      return true
    case 'Number':
      if (!isNaN(parseInt(value))) return false
      return true
    default:
      return false
  }
}

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

/**
 * @author Caleb
 * @description Swal 互動式彈窗
 * @param {Object} options 自訂選項
 * @returns {Promise}
 */
export const swal = (options) => {
  const defaultOPtions = {
    // icon 類型
    // info, warning, success, error, question
    reverseButtons: true,
    confirmButtonText: '確認',
    confirmButtonColor: '#409eff',
    showCancelButton: true,
    cancelButtonText: '取消',
    ...options
  }

  return Swal.fire({ ...defaultOPtions })
}

/**
 * @author Caleb
 * @description 拷貝 array 或 object
 * @param {Object | Array} targetElement 需要被拷貝的對象
 * @param {Object | Array} origin 拷貝來源
 * @returns {Object} 拷貝完的物件
 */
export const deepClone = (targetElement, origin) => {
  const toStr = Object.prototype.toString
  const target = targetElement

  function setFun (obj, key, value) {
    obj[key] = value
  }

  for (const prop in origin) {
    if (hasOwnProperty.call(origin, prop)) {
      switch (toStr.call(target[prop])) {
        case '[object Array]':
        case '[object Object]':
          switch (toStr.call(origin[prop])) {
            case '[object Array]':
            case '[object Object]':
              target[prop] = new origin[prop].constructor()
              deepClone(target[prop], origin[prop])
              break
            default:
              setFun(target, prop, origin[prop])
              break
          }
          break
        default:
          setFun(target, prop, origin[prop])
          break
      }
    }
  }
  return target
}

/**
 * @author Caleb
 * @description 移動到指定的Dom元素 預設跑到專案最上面
 * @param {Element} el Dom元素 <div>
 * @param {Object} options 選項
 *  behavior: auto, smooth
 *  block: start, center, end, nearest
 *  inline: start, center, end, nearest'
 */
export const scrollToEl = (el = document.querySelector('#app'), options = {}) => {
  const setting = {
    behavior: 'smooth',
    block: 'start',
    inline: 'nearest',
    ...options
  }
  const re = new RegExp('Element')

  if (re.test(Object.prototype.toString.call(el))) {
    el.scrollIntoView(setting)
  }
}
