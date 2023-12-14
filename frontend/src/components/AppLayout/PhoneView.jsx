/* eslint-disable react/prop-types */
/* eslint-disable react-hooks/exhaustive-deps */

import routes from '@/router'
import { isEmpty } from '@/lib/utils.js'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { Tooltip } from 'antd'

function PhoneView (props) {
  const {
    homeHeight,
    current,
    setCurrent
  } = props

  return (
    <div
        className={`layout-phone ${isEmpty(current) ? 'is-hidden' : 'is-show'}`}
        style={{
          // left: `${homeWidth}px`,
          top: `${homeHeight}px`
        }}
      >
        <div className='phone phone-header'>
          <nav
            className='header-route'
            onClick={(e) => {
              setCurrent('')
              e.stopPropagation()
            }}
          >
            <div className='header-title'>
              <FontAwesomeIcon icon="fa-solid fa-arrow-left" className='icon'/>
              <label>{ '首頁' }</label>
            </div>
          </nav>
        </div>

        <div className='phone-body'>
          { props.children ?? <div>slot</div> }
        </div>

        <div className='phone phone-footer'>
          <div className='nav-routes'>
            {
              routes.map(route => {
                return (
                  <Tooltip
                    key={route.key}
                    title={route.title}
                    color='lime'
                  >
                    <nav
                      className='nav-route'
                      onClick={() => setCurrent(route.key)}
                    >
                      <div className='nav-title'>
                        <FontAwesomeIcon icon={route.icon} className='icon'/>
                      </div>
                    </nav>
                  </Tooltip>
                )
              })
            }
          </div>
        </div>
      </div>
  )
}

export default PhoneView