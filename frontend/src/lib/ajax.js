import axios from 'axios'
import Swal from 'sweetalert2'

const baseURL = import.meta.env.VITE_API_BASE_URL
const connectApi = import.meta.env.VITE_API_CONNECT_API

const fakeApi = (config, options) => {
  const { fakeData, delay, callback } = options

  return new Promise((resolve) => {
    // 自訂回傳資料
    if (typeof callback === 'function') {
      const resFakeData = callback(config, fakeData)
      setTimeout(() => {
        resolve(resFakeData)
      }, delay)
    // 直接返回假資料
    } else {
      setTimeout(() => {
        resolve(fakeData)
      }, delay)
    }
  })
}

const timeout = 1000 * 60 * 30
const axiosApi = (config, baseUrl) => {
  const instance = axios.create({
    baseURL: baseUrl,
    timeout,
    // 允許帶 cookie
    withCredentials: true,
    headers: {
      'Content-Type': 'application/json;charset=utf8'
    }
  })

  instance.interceptors.request.use(
    (config) => {
      return config
    },
    (error) => {
      console.log('request error', error)
    }
  )

  instance.interceptors.response.use(
    (res) => {
      return res.data
    },
    (error) => {
      console.log('response error', error)

      Swal.fire({
        icon: 'error',
        reverseButtons: true,
        confirmButtonText: '確認',
        title: 'Api Error',
        text: error.message
      })
    }
  )

  return instance(config)
}

/**
 * @author Caleb
 * @description 抓後端資料用
 * @param {Object} config 設定
 *              url: api網址
 *              method: get | post | put | delete
 *              data: 傳到後端資料
 * @param {Object} options
 *              getFakeData: 是否取的假資料
 *              fakeData: 如果是取假資料 返回的資料
 *              status: 資料返回狀態
 *              callback: 自訂回傳假資料
 * @returns {Promise}
 */
export const ajax = (config, options = {}) => {
  const {
    getFakeData = false,
    fakeData = null,
    isLog = false,
    delay = 0,
    callback = null
  } = options

  switch (connectApi) {
    case 'true':
      return axiosApi(config, baseURL)
    case 'false':
      return fakeApi(config, { fakeData, delay, callback })
    case 'auto':
    default:
      if (isLog) {
        const style = `
          font-size: 1em;
          color: #409EFF;
        `
        const { url, method, data } = config

        console.group('%c%s', style, 'api 資訊')
        console.log('%c%s', style, `url: ${url}`)
        console.log('%c%s', style, `method: ${method}`)
        console.log('%c%s', style, `data: ${data}`)
        console.table(data)
        console.groupEnd()
      }
      if (getFakeData) {
        return fakeApi(config, { fakeData, delay, callback })
      } else {
        return axiosApi(config, baseURL)
      }
  }
}

export default ajax
