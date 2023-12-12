/* eslint-disable react-refresh/only-export-components */
import { lazy } from 'react'

import backgroundImage1 from '@/assets/images/photo-1.avif'
import backgroundImage2 from '@/assets/images/photo-2.avif'
import backgroundImage3 from '@/assets/images/photo-3.avif'
import backgroundImage4 from '@/assets/images/photo-4.avif'
import backgroundImage5 from '@/assets/images/photo-5.avif'
import backgroundImage6 from '@/assets/images/photo-6.avif'

const UserView = lazy(() => import('../pages/UserView'))
const EventView = lazy(() => import('../pages/EventView'))
const AttendanceRecordView = lazy(() => import('../pages/AttendanceRecordView'))

const ApiTest = lazy(() => import('../pages/ApiTest.jsx'))
const SignUpForm = lazy(() => import('../pages/SignUpForm'))
const LoginView = lazy(() => import('../pages/LoginView'))

const routes = [
  {
    path: '/userView',
    key: 'userView',
    title: '使用者管理',
    icon: 'fa-solid fa-user',
    iamge: `${backgroundImage1}`,
    component: <UserView />
  },
  {
    path: '/eventView',
    key: 'eventView',
    title: '特會管理',
    icon: 'fa-solid fa-cross',
    iamge: `${backgroundImage2}`,
    component: <EventView />
  },
  {
    path: '/attendanceRecordView',
    key: 'attendanceRecordView',
    title: '報名表管理',
    icon: 'fa-solid fa-file-signature',
    iamge: `${backgroundImage3}`,
    component: <AttendanceRecordView />
  },
  {
    path: '/apiTest',
    key: 'apiTest',
    title: 'Ajax 測試',
    icon: 'fa-solid fa-wifi',
    iamge: `${backgroundImage4}`,
    component: <ApiTest />
  },
  {
    path: '/signUpForm',
    key: 'signUpForm',
    title: '測試用表單',
    icon: 'fa-solid fa-table',
    iamge: `${backgroundImage5}`,
    component: <SignUpForm />
  },
  {
    path: '/loginView',
    key: 'loginView',
    title: '登入',
    icon: 'fa-solid fa-right-to-bracket',
    iamge: `${backgroundImage6}`,
    component: <LoginView />
  }
]

export default routes
