/* eslint-disable react/prop-types */
/* eslint-disable react-hooks/exhaustive-deps */

import { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import routes from '@/router'
import './_layout.scss'
import backgroundImage7 from '@/assets/images/photo-7.avif'
import backgroundImage8 from '@/assets/images/photo-8.avif'
import backgroundImage9 from '@/assets/images/photo-9.avif'
import { Carousel } from 'antd'
import throttle from '@/lib/throttle.js'
import { useMount } from '@/lib/hook.js'

import DesktopView from './DesktopView'
import PhoneView from './PhoneView'

const systemURL = import.meta.env.VITE_API_SYSTEM_URL

let vh = window.innerHeight * 0.01
document.documentElement.style.setProperty('--vh', `${vh}px`)

window.addEventListener('resize', () => {
  let vh = window.innerHeight * 0.01
  document.documentElement.style.setProperty('--vh', `${vh}px`)
})

function AppLayout (props) {
  const navigate = useNavigate()

  const [current, setCurrent] = useState('')

  const changeRouter = (key) => {
    navigate(`${systemURL}/${key}`)
  }

  useEffect(() => {
    changeRouter(current)
  }, [current])

  // const [homeWidth, setWidth] = useState(0)
  const [homeHeight, setHeight] = useState(0)

  const updateSize = (_width, _height) => {
    // setWidth(_width)
    setHeight(_height)
  }

  const ROcallback = throttle((entries) => {
    entries.forEach((entry) => {
      const { contentRect } = entry
      const { width, height } = contentRect
      updateSize(width, height)
    })
  }, 100)
  const RO = new ResizeObserver(ROcallback)

  useMount(async () => {
    const el = document.querySelector('.__ro__')
    RO.observe(el)
  })

  return (
    <div className="layout layout-wrapper">
      <div className='layout-imgs'>
        <Carousel autoplay autoplaySpeed={3000} dots={false} infinite>
          <img src={backgroundImage7} className='layout-img' alt="background7" />
          <img src={backgroundImage8} className='layout-img' alt="background8" />
          <img src={backgroundImage9} className='layout-img' alt="background9" />
        </Carousel>
      </div>
      <div className='layout-bg'></div>

      <div className="layout-home __ro__">
        <div className='home-logo'>
          <h2 className='title text-sign' onClick={() => setCurrent('')}>LOGO</h2>
        </div>

        <div className='home-routes'>
          {
            routes.map(route => {
              return (
                <nav
                  key={route.key}
                  className='home-route'
                  onClick={() => setCurrent(route.key)}
                >
                  <img className='img' src={route.iamge} alt={route.title} />
                  <div className='bg'></div>
                  <div className='title'>
                    <label>{route.title}</label>
                  </div>
                </nav>
              )
            })
          }
        </div>
      </div>

      <DesktopView
        homeHeight={homeHeight}
        current={current}
        setCurrent={setCurrent}
      >
        <h3>DesktopView</h3>
        { props.children ?? <div>slot</div> }
      </DesktopView>

      <PhoneView
        homeHeight={homeHeight}
        current={current}
        setCurrent={setCurrent}
      >
        <h3>PhoneView</h3>
        { props.children ?? <div>slot</div> }
      </PhoneView>
    </div>
  )
}

export default AppLayout
