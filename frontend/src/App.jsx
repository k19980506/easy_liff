// import { useState } from 'react'
import './App.scss'
import AppLayout from './components/AppLayout'
import {
  BrowserRouter
  // HashRouter
} from 'react-router-dom'
import View from '@/components/AppLayout/View.jsx'

import { library } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'

library.add(fas, fab, far)

function App () {
  return (
    <div className="app">
      <BrowserRouter>
        <AppLayout>
          <View></View>
        </AppLayout>
      </BrowserRouter>
    </div>
  )
}

export default App
