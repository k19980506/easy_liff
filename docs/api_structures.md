# Data Structures

## BadRequest (object)

- `error`: "Invalid date format" (string, required)

## NotFound (object)

- `error`: "Record not found" (string, required)

## Gender (enum)

### Members

- `male`
- `female`

## Status (object)

- `breakfast`: false (boolean, required)
- `lunch`: false (boolean, required)
- `dinner`: true (boolean, required)
- `accommodation`: true (boolean, required)

## Detail (object)

- `date`: `2024-02-01` (string, required)
- `status` (Status, required)

## CreateUsersRequestBody (object)

- `line_id`: `U4af4980629111` (string, required)
- `user_details` (array, required)
  - (object)
    - `name`: `Jesus` (string, required)
    - `date_of_birth`: `2000-12-25` (string, required)
    - `gender`: `male` (Gender, required)

## UpdateUserRequestBody (object)

- `name`: `Jesus` (string, optional)
- `date_of_birth`: `2000-12-25` (string, optional)
- `gender`: `male` (Gender, optional)
- `line_id`: `U4af4980629111` (string, optional)

## UpdateEventRequestBody (object)

- `titile`: `202402` (string, optional)
- `start_date`: `2000-12-20` (string, optional)
- `end_date`: `2000-12-25` (string, optional)
- `options` (array[Detail], optional)

## User (object)

- `id`: 1 (number, required)
- `name`: `Jesus` (string, required)
- `age`: 25 (number, required)
- `gender`: `male` (Gender, required)
- `line_id`: `U4af4980629111` (string, required)

## Event (object)

- `title`: `202402` (string, required)
- `start_date`: `2024-02-01` (string, required)
- `end_date`: `2024-02-03` (string, required)
- `options` (array[Detail], required)

## AttendanceRecord (object)

- `user_id`: `65660e60f4da117ad80301f0` (string, required)
- `event_id`: `656cc604f4da1107bc7b1961` (string, required)
- `attendance_status` (array[Detail], required)
