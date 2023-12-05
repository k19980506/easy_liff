// import { useState } from 'react'
import reactLogo from './assets/images/react.svg'
import viteLogo from '/vite.svg'
import './App.scss'
import SignupForm from '@/pages/SignUpForm/SignUpForm.jsx'
import ApiTest from '@/pages/ApiTest.jsx'

function App () {
  // const [count, setCount] = useState(0)

  return (
    <>
      <div className='text-danger border-success' style={{ display: 'none' }}>
        <img src={viteLogo} className="logo" alt="Vite logo" />
        <img src={reactLogo} className="logo react" alt="React logo" />
        <h3>test</h3>
      </div>

      <SignupForm />

      <div className='i-ma-lg'>
        <ApiTest />
      </div>
    </>
  )
}

export default App
