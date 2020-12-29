require_relative "./app"
require_relative './controllers/users_controller'

use UsersController
run Chitter
