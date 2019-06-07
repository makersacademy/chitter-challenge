require 'sinatra/base'

class Chitter < Sinatra::Base
attr_reader :messages
  get '/' do
  end

  get '/register' do
    erb :'register'
  end

  post '/registering' do
    # user = User.new(user_name: params[:user_name], password: params[:password] )
    redirect '/welcome'
  end

  get '/welcome' do
    @messages = Peep.all
    erb :'welcome'
  end

  run! if app_file == $PROGRAM_NAME
end
