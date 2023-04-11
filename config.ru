# file: config.ru
require './controllers/application_controller'
require './controllers/user_controller'

use UserController
run Application