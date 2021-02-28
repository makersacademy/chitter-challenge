require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    redirect :peeps
  end

  get '/peeps' do
    erb :"peeps/index"
  end

  run! if app_file == $PROGRAM_NAME
end
