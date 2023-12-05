# Data Structures

## BadRequest (object)

- `code`: `400-00` (string, required)
- `name`: `BadRequest` (string, required)

## DocumentNotFound (object)

- `code`: `404-00` (string, required)
- `name`: `DocumentNotFound` (string, required)

## Gender (enum)

### Members

- `male`
- `female`

## Status (object)

- `breakfast`: false (boolean, required)
- `lunch`: false (boolean, required)
- `dinner`: true (boolean, required)
- `accommodation`: true (boolean, required)

## StatusWithCount (Status)

- `breakfast_count`: 3 (number, required)
- `lunch_count`: 2 (number, required)
- `dinner_count`: 1 (number, required)
- `accommodation_count`: 0 (number, required)

## Detail (object)

- `date`: `2024-02-01` (string, required)
- `status` (Status, required)

## DetailWithCount (object)

- `date`: `2024-02-01` (string, required)
- `status` (StatusWithCount, required)

## CreateLineUsersRequestBody (object)

- `line_id`: `U4af4980629111` (string, required)
- `user_details` (array, required)
  - (object)
    - `name`: `Jesus` (string, required)
    - `date_of_birth`: `2000-12-25` (string, required)
    - `gender`: `male` (Gender, required)
    - `church_name`: `neli` (string, required)

## CreateUsersRequestBody (object)

- `line_id`: `U4af4980629111` (string, required)
- `name`: `Jesus` (string, required)
- `date_of_birth`: `2000-12-25` (string, required)
- `gender`: `male` (Gender, required)
- `church_name`: `neli` (string, required)

## UpdateUserRequestBody (object)

- `name`: `Jesus` (string, optional)
- `date_of_birth`: `2000-12-25` (string, optional)
- `gender`: `male` (Gender, optional)
- `line_id`: `U4af4980629111` (string, optional)
- `church_name`: `neli` (string, optional)

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

## User (object)

- `id`: `65660e60f4da117ad80301f0` (string, required)
- `name`: `Jesus` (string, required)
- `age`: 25 (number, required)
- `date_of_birth`: "2000-12-25" (string, required)
- `gender`: `male` (Gender, required)
- `line_id`: `U4af4980629111` (string, required)
- `church_name`: `neli` (string, required)

## Event (object)

- `id`: `656cc604f4da1107bc7b1961` (string, required)
- `title`: `202402` (string, required)
- `start_date`: `2024-02-01` (string, required)
- `end_date`: `2024-02-03` (string, required)
- `options` (array[DetailWithCount], required)

## AttendanceRecord (object)

- `user_id`: `65660e60f4da117ad80301f0` (string, required)
- `event_id`: `656cc604f4da1107bc7b1961` (string, required)
- `attendance_status` (array[Detail], required)

## Church (object)

- `name`: `neli` (string, required)
