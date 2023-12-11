# Data Structures

## BadRequest (object)

- `code`: `400-00` (string, required)
- `name`: `BadRequest` (string, required)

## DocumentNotFound (object)

- `code`: `404-00` (string, required)
- `name`: `DocumentNotFound` (string, required)

## MealReport (object)

+ `adult`: 0 (number, required)
+ `child`: 0 (number, required)

## DailyReport (object)

- `date`: `2024-02-01` (string, required)
- `breakfast` (MealReport, required)
- `lunch` (MealReport, required)
- `dinner` (MealReport, required)
- `accommodation` (MealReport, required)

## MemberReport (object)

- `total_member`: 0 (number, required)
- `total_male_member`: 0 (number, required)
- `total_female_member`: 0 (number, required)
- `total_baby_member`: 0 (number, required)
- `total_primary_member`: 0 (number, required)
- `total_junior_member`: 0 (number, required)
- `details` (DailyReport)

## Gender (enum)

### Members

- `male`
- `female`

## Status (object)

- `breakfast`: false (boolean, required)
- `lunch`: false (boolean, required)
- `dinner`: true (boolean, required)
- `accommodation`: true (boolean, required)

## Count (object)

- `breakfast_count`: 3 (number, required)
- `lunch_count`: 2 (number, required)
- `dinner_count`: 1 (number, required)
- `accommodation_count`: 0 (number, required)

## Detail (object)

- `date`: `2024-02-01` (string, required)
- `status` (Status, required)

## DetailWithCount (object)

- `date`: `2024-02-01` (string, required)
- `count` (Count, required)

## CreateLineUsersRequestBody (object)

- `line_id`: `U4af4980629111` (string, required)
- `user_details` (array, fixed-type)
    - (object)
        - `name`: `Jesus` (string, required)
        - `date_of_birth`: `2000-12-25` (string, required)
        - `gender`: `male` (Gender, required)
        - `church_name`: `內壢` (string, required)

## CreateUsersRequestBody (object)

- `line_id`: `U4af4980629111` (string, required)
- `name`: `Jesus` (string, required)
- `date_of_birth`: `2000-12-25` (string, required)
- `gender`: `male` (Gender, required)
- `church_name`: `內壢` (string, required)

## UpdateUserRequestBody (object)

- `name`: `Jesus` (string, optional)
- `date_of_birth`: `2000-12-25` (string, optional)
- `gender`: `male` (Gender, optional)
- `line_id`: `U4af4980629111` (string, optional)
- `church_name`: `內壢` (string, optional)

## CreateEventRequestBody (object)

- `titile`: `202402` (string, required)
- `start_date`: `2000-12-20` (string, required)
- `end_date`: `2000-12-25` (string, required)
- `options` (array[Detail], required)

## UpdateEventRequestBody (object)

- `titile`: `202402` (string, optional)
- `start_date`: `2000-12-20` (string, optional)
- `end_date`: `2000-12-25` (string, optional)
- `options` (array[Detail], optional)

## CreateAttendanceRecordRequestBody (object)

- `user_id`: `65660e60f4da117ad80301f0` (string, required)
- `event_id`: `656cc604f4da1107bc7b1961` (string, required)
- `attendance`: true (boolean, reuired)
- `attendance_status` (array[Detail], nullable)

## UpdateAttendanceRecordRequestBody (object)

- `attendance_status` (array[Detail], required)

## User (object)

- `id`: `65660e60f4da117ad80301f0` (string, required)
- `name`: `Jesus` (string, required)
- `grade`: 25 (number, required)
- `date_of_birth`: `2000-12-25` (string, required)
- `gender`: `male` (Gender, required)
- `line_id`: `U4af4980629111` (string, required)
- `church_name`: `內壢` (string, required)

## Event (object)

- `id`: `656cc604f4da1107bc7b1961` (string, required)
- `title`: `202402` (string, required)
- `start_date`: `2024-02-01` (string, required)
- `end_date`: `2024-02-03` (string, required)
- `attendance` (array[Detail], required)

## AttendanceRecord (object)

- `name`: `King` (string, required)
- `gender`: `male` (string, required)
- `grade`: 25 (number, required)
- `church_name`: `內壢` (string, required)
- `title`: `202312` (string, required)
- `attendance`: true (boolean, required)
- `attendance_status` (array[Detail], nullable)

## Church (object)

- `name`: `內壢` (string, required)

## EventReport (object)

- `total` (MemberReport, required)
- `neli` (MemberReport, required)
- `xizhi` (MemberReport, required)
- `sanchong` (MemberReport, required)
- `yongkong` (MemberReport, required)
