require_relative './helpers/chitter_helpers'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers ChitterHelpers

  get '/' do
    erb :index
  end

  run! if $PROGRAM_NAME == "lib/app.rb"
end
