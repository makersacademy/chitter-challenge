require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base

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

  post '/message_posted' do
     p "Form data submited"
     Peep.post(message: params['message'])
     redirect 'welcome'
  end

  run! if app_file == $PROGRAM_NAME
end
