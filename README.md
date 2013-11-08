# ka_ext_users

This is the users extension. It acts like a data source for the modules, and provides basic CRUD operations for the following resources: users, tokens.
It exposes the following calls:

It brings to the main application the following routes:
- GET /mount-base/users
- GET /mount-base/users/:id
- POST /mount-base/users
- PATCH /mount-base/users/:id
- PUT /mount-base/users/:id
- DELETE /mount-base/users/:id
 
- GET /mount-base/tokens
- GET /mount-base/tokens/:id
- POST /mount-base/tokens
- PATCH /mount-base/tokens/:id
- PUT /mount-base/tokens/:id
- DELETE /mount-base/tokens/:id
 
- GET /mount-base/users/:user_id/tokens
- GET /mount-base/users/:user_id/tokens/:id
- POST /mount-base/users/:user_id/tokens
- PATCH /mount-base/users/:id/tokens/:id
- PUT /mount-base/users/:user_id/tokens/:id
- DELETE /mount-base/users/:user_id/tokens/:id
