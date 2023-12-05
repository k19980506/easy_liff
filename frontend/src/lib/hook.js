import { useState, useEffect } from 'react'

export const useMount = (callback = () => {}) => {
  const [mounted, setMounted] = useState(false)

  useEffect(() => {
    if (!mounted) {
      setMounted(true)
      callback()
    }
  }, [mounted, callback])
}

export const useDebounce = (value, delay) => {
  const [debounceValue, setDebounceValue] = useState(value)

  useEffect(() => {
    const timeout = setTimeout(() => setDebounceValue(value), delay)
    return () => clearTimeout(timeout)
  }, [value, delay])

  return debounceValue
}

export const useArray = (value) => {
  const [tempValue, setTempValue] = useState(value)

  return {
    list: tempValue,
    setList: setTempValue,
    clear () {
      setTempValue([])
    },
    remove (index) {
      const temp = [...tempValue]

      if (typeof index === 'number') {
        temp.splice(index, 1)
      } else {
        temp.pop()
      }
      setTempValue(temp)
    },
    change (data, index) {
      const temp = [...tempValue]
      temp.splice(index, 1, data)
      setTempValue(temp)
    },
    add (data, index) {
      const temp = [...tempValue]

      if (typeof index === 'number') {
        temp.splice(index, 0, data)
      } else {
        temp.push(data)
      }
      setTempValue(temp)
    },
    addList (data) {
      const temp = [...tempValue]
      temp.push(...data)
      setTempValue(temp)
    }
  }
}
