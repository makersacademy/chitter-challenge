require 'require_all'

require_all 'app'

require_relative 'app/controllers/user_controller'
require_relative 'app/controllers/peep_controller'

use Rack::MethodOverride

use UserController
use PeepController
run ApplicationController
