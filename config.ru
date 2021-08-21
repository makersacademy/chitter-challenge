require './config/environment'
require_all 'app'

use UserController
use PeepController
use Rack::MethodOverride

run ApplicationController
