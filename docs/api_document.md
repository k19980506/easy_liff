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

### Update [PUT]

Update the user by user id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the user to update
- Response 200

### Delete [DELETE]

Delete the user by user id

- Parameters
  - id: `65660e60f4da117ad80301f0` (string) - UUID of the user to delete
- Response 204

## Line Users [/api/v1/users/line/{id}]

### Get Users by LINE ID [GET]

List users by LINE ID

- Parameters
  - id: `U4af4980629111` (string) - LINE ID of the users to retrieve
- Response 200

## Users Collection [/api/v1/users]

### Create [POST]

Create users

- Request
  - Attributes (CreateUsersRequestBody)
- Response 201 (application/json)
  - Attributes (array[User], fixed-type)
- Response 400 (application/json)
  - Attributes (BadRequest, fixed-type)

### Index [GET]

List all users

- Response 200
