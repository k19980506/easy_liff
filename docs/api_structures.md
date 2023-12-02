# Data Structures

## BadRequest

- `error`: "error" (string, required)

## Gender (enum)

### Members

- `male`
- `female`

## Participation (object)

- `breakfast`: false (boolean, required)
- `lunch`: false (boolean, required)
- `dinner`: true (boolean, required)
- `accommodation`: true (boolean, required)

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

- `id`: 20240201 (number, required)
- `title`: `202402` (string, required)
- `participation` (Participation, required)
