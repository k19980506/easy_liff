import { Suspense } from 'react'
import routes from '@/router'
import { Routes, Route } from 'react-router-dom'

const systemURL = import.meta.env.VITE_API_SYSTEM_URL

function View () {
  return (
    <Suspense fallback={<div>loading...</div>}>
      <Routes>
        <Route path='/' element={<div>Empty</div>} />
        <Route index element={<div>Index</div>} />
        {
          routes.map(router => {
            const { path, key, component } = router

            return <Route
              path={`${systemURL}${path}`}
              key={key}
              element={component}
            />
          })
        }
      </Routes>
    </Suspense>
  )
}

export default View
