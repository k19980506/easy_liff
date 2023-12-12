import { useState, useEffect } from 'react'
import ajax from '@/lib/ajax.js'
import { useMount } from '@/lib/hook.js'

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

function UserView () {
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
      <h3>UserView</h3>
    </div>
  )
}

export default UserView
