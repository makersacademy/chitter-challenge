require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    flash.now[:message] = 'No peeps posted yet!'
    erb :peeps
  end

  run! if app_file == $PROGRAM_NAME
end
