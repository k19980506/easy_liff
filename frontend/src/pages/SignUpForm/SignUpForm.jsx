// SignupForm.js

import { useState } from 'react'
import DatePicker from 'react-datepicker'
import { useTranslation } from 'react-i18next'
import 'react-datepicker/dist/react-datepicker.css'
import 'bootstrap/dist/css/bootstrap.min.css'
import './i18n.js'

const initialEventSchedule = () => {
  const initialSchedule = {}

  // 假設有特定的日期範圍，這裡以 '12/1', '12/2', '12/3' 為例
  const dates = ['12/1', '12/2', '12/3']

  // 初始化每個日期的事件為 false
  dates.forEach((date) => {
    initialSchedule[date] = {
      breakfast: false,
      lunch: false,
      dinner: false,
      accommodation: false
    }
  })

  return initialSchedule
}

const SignupForm = () => {
  const { t } = useTranslation()
  const [name, setName] = useState('')
  const [gender, setGender] = useState('male')
  const [birthdate, setBirthdate] = useState(new Date())
  const [eventSchedule, setEventSchedule] = useState(initialEventSchedule())

  // Dummy data for event schedule
  const dummyEventSchedule = {
    '12/1': {
      breakfast: false,
      lunch: false,
      dinner: false,
      accommodation: false
    },
    '12/2': {
      breakfast: false,
      lunch: false,
      dinner: false,
      accommodation: false
    },
    '12/3': {
      breakfast: false,
      lunch: false,
      dinner: false,
      accommodation: false
    }
  }

  const handleEventCheckboxChange = (date, event) => {
    setEventSchedule((prevSchedule) => ({
      ...prevSchedule,
      [date]: { ...prevSchedule[date], [event]: !prevSchedule[date]?.[event] }
    }))
  }

  const handleSelectAll = () => {
    const dates = Object.keys(dummyEventSchedule)

    const allTrue = dates.every((date) =>
      Object.values(eventSchedule[date]).every((value) => value === true)
    )

    const updatedSchedule = dates.reduce(
      (schedule, date) => ({
        ...schedule,
        [date]: Object.keys(eventSchedule[date]).reduce((acc, event) => {
          acc[event] = allTrue ? false : true
          return acc
        }, {})
      }),
      {}
    )

    console.log(updatedSchedule)

    setEventSchedule((prevSchedule) => ({
      ...prevSchedule,
      ...updatedSchedule
    }))
  }

  const handleSubmit = (e) => {
    e.preventDefault()

    // 在這裡處理提交邏輯，可以發送請求到後端保存報名信息

    console.log(t('NameLabel'), name)
    console.log(t('GenderLabel'), gender)
    console.log(t('BirthdayLabel'), birthdate)
    console.log(t('EventScheduleLabel'), eventSchedule)
  }

  return (
    <div className='container mt-4'>
      <h2>{t('title')}</h2>
      <form onSubmit={handleSubmit}>
        <div className='form-group'>
          <label>{t('name')}</label>
          <input
            type='text'
            className='form-control'
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </div>
        <div className='form-group'>
          <label>{t('gender')}</label>
          <div className='form-check'>
            <input
              type='radio'
              className='form-check-input'
              value='man'
              checked={gender === 'man'}
              onChange={() => setGender('man')}
            />
            <label className='form-check-label'>{t('man')}</label>
          </div>
          <div className='form-check'>
            <input
              type='radio'
              className='form-check-input'
              value='women'
              checked={gender === 'women'}
              onChange={() => setGender('women')}
            />
            <label className='form-check-label'>{t('women')}</label>
          </div>
        </div>
        <div className='form-group'>
          <label>{t('birthday')}</label>
          <DatePicker
            selected={birthdate}
            onChange={(date) => setBirthdate(date)}
            dateFormat='yyyyMMdd'
            className='form-control'
          />
        </div>

        <h3 className='mt-4'>{t('eventTitle')}</h3>
        <table className='table table-bordered'>
          <thead>
            <tr>
              <th>
                <button
                  type='button'
                  className='btn btn-secondary'
                  onClick={handleSelectAll}
                >
                  {t('selectAll')}
                </button>
              </th>
              {Object.keys(dummyEventSchedule).map((date) => (
                <th key={date}>{date}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{t('breakfast')}</td>
              {Object.keys(dummyEventSchedule).map((date) => (
                <td key={date}>
                  <div className='form-check'>
                    <input
                      type='checkbox'
                      className='form-check-input'
                      checked={eventSchedule[date]?.breakfast}
                      onChange={() =>
                        handleEventCheckboxChange(date, 'breakfast')
                      }
                    />
                  </div>
                </td>
              ))}
            </tr>
            <tr>
              <td>{t('lunch')}</td>
              {Object.keys(dummyEventSchedule).map((date) => (
                <td key={date}>
                  <div className='form-check'>
                    <input
                      type='checkbox'
                      className='form-check-input'
                      checked={eventSchedule[date]?.lunch}
                      onChange={() => handleEventCheckboxChange(date, 'lunch')}
                    />
                  </div>
                </td>
              ))}
            </tr>
            <tr>
              <td>{t('dinner')}</td>
              {Object.keys(dummyEventSchedule).map((date) => (
                <td key={date}>
                  <div className='form-check'>
                    <input
                      type='checkbox'
                      className='form-check-input'
                      checked={eventSchedule[date]?.dinner}
                      onChange={() => handleEventCheckboxChange(date, 'dinner')}
                    />
                  </div>
                </td>
              ))}
            </tr>
            <tr>
              <td>{t('accommodation')}</td>
              {Object.keys(dummyEventSchedule).map((date) => (
                <td key={date}>
                  <div className='form-check'>
                    <input
                      type='checkbox'
                      className='form-check-input'
                      checked={eventSchedule[date]?.accommodation}
                      onChange={() =>
                        handleEventCheckboxChange(date, 'accommodation')
                      }
                    />
                  </div>
                </td>
              ))}
            </tr>
          </tbody>
        </table>

        <br />
        <button type='submit' className='btn btn-primary mt-2'>
          {t('submit')}
        </button>
      </form>
    </div>
  )
}
export default SignupForm
