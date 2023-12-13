/* eslint-disable react/prop-types */
/* eslint-disable react-hooks/exhaustive-deps */

import routes from '@/router'
import { isEmpty } from '@/lib/utils.js'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'

function DesktopView (props) {
  const {
    homeHeight,
    current,
    setCurrent
  } = props

  return (
    <div
        className={`layout-desktop ${isEmpty(current) ? 'is-hidden' : 'is-show'}`}
        style={{
          // left: `${homeWidth}px`,
          top: `${homeHeight}px`
        }}
      >
        <div className='desktop desktop-nav'>
          <div className='nav-routes'>
            <nav
              className='nav-route'
              onClick={(e) => {
                setCurrent('')
                e.stopPropagation()
              }}
            >
              <div className='nav-title'>
                <FontAwesomeIcon icon="fa-solid fa-house" className='icon'/>
                <label>{ '首頁' }</label>
              </div>
            </nav>
            {
              routes.map(route => {
                return (
                  <nav
                    key={route.key}
                    className='nav-route'
                    onClick={() => setCurrent(route.key)}
                  >
                    <div className='nav-title'>
                      <FontAwesomeIcon icon={route.icon} className='icon'/>
                      <label>{route.title}</label>
                    </div>
                  </nav>
                )
              })
            }
          </div>
        </div>

        <div className='desktop-slot'>
          { props.children ?? <div>slot</div> }
        </div>
      </div>
  )
}

export default DesktopView