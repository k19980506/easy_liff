<!-- include(./api_structures.md) -->

# `EASY_LIFF API`

Use `npx aglio -i ./docs/api_document.md -s -p 3002 --theme-variables cyborg` to run a live preview server on http://localhost:3002/.

## Group Users

### Retrieve users by line id [GET /users/{id}]

- Parameters
  - id: `U4af4980629111` (string) - Line ID of the Users to retrieve
- Response 200 (application/json)
  - Attributes (array[User], fixed-type)

### Create the users [POST /users]

- Request
  - Attributes (CreateUsersRequestBody)
- Response 200 (application/json)
  - Attributes (array[User], fixed-type)
