module.exports = {
  root: true,
  env: { browser: true, es2020: true },
  extends: [
    'eslint:recommended',
    'plugin:react/recommended',
    'plugin:react/jsx-runtime',
    'plugin:react-hooks/recommended',
  ],
  ignorePatterns: ['dist', '.eslintrc.cjs'],
  parserOptions: { ecmaVersion: 'latest', sourceType: 'module' },
  settings: { react: { version: '18.2' } },
  plugins: ['react-refresh'],
  rules: {
    'react-refresh/only-export-components': [
      'warn',
      { allowConstantExport: true },
    ],
    // 要求使用 === 和 !==
    eqeqeq: ['warn', 'always'],
    // 不要分號
    semi: ['warn', 'never'],
    // 使用單引號
    quotes: ['warn', 'single'],
    // 逗號 前面不空格 後面要空格
    'comma-spacing': ['warn', { 'before': false, 'after': true }],
    // object 冒號 前面不空格 後面號空格
    'key-spacing': ['warn', { 'beforeColon': false, 'afterColon': true }],
    // 操作符前後需要加空格: + - * /
    'space-infix-ops': 'warn',
    // ojbect, array 最後一格不要加上逗號
    'comma-dangle': ['warn', 'never'],
    // 行末禁止加空格
    'no-trailing-spaces': 'warn',
    // 前頭函數 前後空格
    'arrow-spacing': ['warn', { 'before': true, 'after': true }],
    // 函數前面加空格
    'space-before-function-paren': ['warn', 'always']
  },
}
