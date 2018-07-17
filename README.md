# README #

### APIs ###

* Login
    * URL: http://localhost:3000/api/v1/sign_in
    * Type: POST
    * Params: {"email": "test@gmail.com", "password": "password"}
    * Response: {status: 200, user: {user_info}, user_token: "tghwerhvjgrtyuop"}

* SignUp
    * URL: http://localhost:3000/api/v1/sign_up
    * Type: POST
    * Params: {"email": "test@gmail.com", "password": "password"}
    * Response: { status: 200, user: {user_info}, message: 'Success' }

* Reset Password
    * URL: http://localhost:3000/api/v1/reset_password
    * Type: POST
    * Params: {"email": "test@gmail.com"}
    * Response: { status: 200, message: 'Reset Password instructions has been sent on your email' }

* Logout
    * URL: http://localhost:3000/api/v1/sign_out
    * Type: DELETE
    * Params: 
    * Response: {status: 200, message: "Success"}

* Get All Users
    * URL: http://localhost:3000/api/v1/users?user_token=tghwerhvjgrtyuop
    * Type: GET
    * Params: 
    * Response: { users: {users_info}, total_count: 20 }

* Change Password
    * URL: http://localhost:3000/api/v1/change_password
    * Type: POST
    * Params: {"password": "password", "password_confirmation": "password"}
    * Response: { status: 200, user_id: 1, message: 'Password changed' }

* Change Profile
    * URL: http://localhost:3000/api/v1/change_profile
    * Type: POST
    * Params: {"user_token": "tghwerhvjgrtyuop", "email": "test@gmail.com",     * "password": "password"}
    * Response: { user_id: 1, email: "test@gmail.com", user_token: "tghwerhvjgrtyuop" }

* OCR Reader (Image to String)
    * URL: http://localhost:3000/api/v1/image_to_string
    * Type: POST
    * Params: {"user_token": "tghwerhvjgrtyuop", "image": {image_upload}}
    * Response: { "status": 200, "message": "Rails\nhas\na\nnew\logo" }
