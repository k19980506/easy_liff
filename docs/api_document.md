<!-- include(./api_structures.md) -->

# `EASY_LIFF API`

Use `npx aglio -i ./docs/api_document.md -s -p 3002 --theme-variables cyborg` to run a live preview server on http://localhost:3002/.

# Group Users

## User [/api/v1/users/{id}]

### Show [GET]

Get the user by user id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the User to retrieve
- Response 200 (application/json)
  - Attributes (User, fixed-type)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

### Update [PUT]

Update the user by user id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the user to update
- Request
  - Attributes (UpdateUserRequestBody)
- Response 200 (application/json)
  - Attributes (User, fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

### Delete [DELETE]

Delete the user by user id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the user to delete
- Response 204 (application/json)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

## Users Collection [/api/v1/users]

### Create [POST]

Create user

- Request
  - Attributes (CreateUsersRequestBody)
- Response 201 (application/json)
  - Attributes (User, fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)

### Index [GET]

List all users

- Response 200 (application/json)

  - Attributes (array[User], fixed-type)

# Group Line Users

## Line Users [/api/v1/line_users/{id}]

### Get [GET]

List users by LINE ID

- Parameters
  - id: `U4af4980629111` (string) - LINE ID of the users to retrieve
- Response 200 (application/json)
  - Attributes (array[User], fixed-type)

### Delete [DELETE]

Delete users by LINE ID

- Parameters
  - id: `U4af4980629111` (string) - LINE ID of the users to delete
- Response 204 (application/json)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

### Create [/api/v1/line_users]

Create users

- Request
  - Attributes (CreateLineUsersRequestBody)
- Response 201 (application/json)
  - Attributes (array[User], fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)

# Group Events

## Event [/api/v1/events/{id}]

### Show [GET]

Get the event by event id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the event to retrieve
- Response 200 (application/json)
  - Attributes (Event, fixed-type)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

### Update [PUT]

Update the event by event id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the event to update
- Request
  - Attributes (UpdateEventRequestBody)
- Response 200 (application/json)
  - Attributes (Event, fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

### Delete [DELETE]

Delete the event by event id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the event to delete
- Response 204 (application/json)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

## Event Collection [/api/v1/events]

### Create [POST]

Create the event

- Request
  - Attributes (CreateEventRequestBody)
- Response 201 (application/json)
  - Attributes (Event, fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)

### Index [GET]

List all events

- Response 200 (application/json)
  - Attributes (array[Event], fixed-type)

# Group AttendanceRecords

## AttendanceRecord [/api/v1/attendance_records/{id}]

### Show [GET]

Get the attendance record by attendance record id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the attendance record to retrieve
- Response 200 (application/json)
  - Attributes (AttendanceRecord, fixed-type)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

### Update [PUT]

Update the attendance record by attendance record id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the attendance record to update
- Request
  - Attributes (AttendanceRecord)
- Response 200 (application/json)
  - Attributes (AttendanceRecord, fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

### Delete [DELETE]

Delete the attendance record by attendance record id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the attendance record to delete
- Response 204 (application/json)
- Response 404 (application/json)
  - Attributes (DocumentNotFound, fixed-type)

## AttendanceRecord Collection [/api/v1/attendance_records]

### Create [POST]

Create the attendance record

- Request
  - Attributes (array[AttendanceRecord])
- Response 201 (application/json)
  - Attributes (array[AttendanceRecord], fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)

### Index [GET]

List all attendance records

- Response 200 (application/json)
  - Attributes (array[AttendanceRecord], fixed-type)

# Group Churches

## Church Collection [/api/v1/churches]

### Index [GET]

List all churches name

- Response 200 (application/json)
  - Attributes (array[string], required)
