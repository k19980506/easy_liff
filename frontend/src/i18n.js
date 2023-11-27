// i18n.js

import i18n from "i18next";
import { initReactI18next } from "react-i18next";

// 設定 i18n
i18n.use(initReactI18next).init({
  lng: "zh", // 預設語言
  fallbackLng: "zh", // 使用者選擇的語言不存在時的後備語言
  keySeparator: ".", // 用於分隔 namespace 和 key 的分隔符
  interpolation: {
    escapeValue: false, // 不進行 HTML 轉義
  },
  resources: {
    en: {
      translation: {
        title: "Event Sign Up",
        name: "Name:",
        gender: "Gender:",
        man: "Man",
        women: "Women",
        birthday: "Birthday:",
        eventTitle: "Event Detail",
        selectAll: "Select All",
        breakfast: "Breakfast",
        lunch: "Lunch",
        dinner: "Dinner",
        accommodation: "Accommodation",
        submit: "Submit",
      },
    },
    zh: {
      translation: {
        title: "報名表單",
        name: "姓名:",
        gender: "性別:",
        man: "男",
        women: "女",
        birthday: "生日:",
        eventTitle: "活動報名",
        selectAll: "全選",
        breakfast: "早餐",
        lunch: "午餐",
        dinner: "晚餐",
        accommodation: "住宿",
        submit: "送出",
      },
    },
  },
});

export default i18n;
