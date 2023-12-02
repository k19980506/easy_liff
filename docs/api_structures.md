# Data Structures

## BadRequest (object)

- `error`: "error" (string, required)

## Gender (enum)

### Members

- `male`
- `female`

## Status (object)

- `breakfast`: false (boolean, required)
- `lunch`: false (boolean, required)
- `dinner`: true (boolean, required)
- `accommodation`: true (boolean, required)

## Options (object)

- `date`: `2024-02-01` (string, required)
- `status`` (Status, required)

## CreateUsersRequestBody (object)

- `line_id`: `U4af4980629111` (string, required)
- `user_details` (array, required)
  - (object)
    - `name`: `Jesus` (string, required)
    - `date_of_birth`: `2000-12-25` (string, required)
    - `gender`: `male` (Gender, required)

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
- `options` (array[Options], required)
