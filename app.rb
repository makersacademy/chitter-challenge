# RESTful routes
# GET /peeps
# GET /peeps/:id
# GET /peeps/new
# GET /peeps/update
# POST /peeps
# POST /peeps/:id/update
# POST /peeps/:id/delete

require 'sinatra'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  disable :strict_paths

  get '/' do
    'Chitter'
  end

  run! if app_file == $PROGRAM_NAME
end