import { useState, useEffect } from 'react'
import ajax from '@/lib/ajax.js'
import { useMount } from '@/lib/hook.js'

import reactLogo from '@/assets/images/react.svg'
import viteLogo from '/vite.svg'

const getTodosData = async () => {
  const res = await ajax({
    url: '/todos',
    method: 'get',
    data: {}
  }, {
    getFakeData: false,
    fakeData: [
      {
        'userId': 1,
        'id': 1,
        'title': 'delectus aut autem',
        'completed': false
      },
      {
        'userId': 2,
        'id': 2,
        'title': 'quis ut nam facilis et officia qui',
        'completed': false
      }
    ],
    delay: 300
  })

  return res
}

function ApiTest () {
  const [apiData, setApiData] = useState([])

  useEffect(() => {
    console.log('apiData => ', apiData)
  }, [apiData])

  useMount(async () => {
    const res = await getTodosData()
    setApiData(res)
  })

  return (
    <div className='text-danger border-success'>
      <img src={viteLogo} className="logo" alt="Vite logo" />
      <img src={reactLogo} className="logo react" alt="React logo" />
      <h3>ApiTest</h3>
    </div>
  )
}

export default ApiTest
