require 'sinatra/base'
require 'bcrypt'
#require 'sinatra/flash'

class Chitter < Sinatra::Base
  
  get '/' do
  	erb :index
  end

  get '/sign_up' do
    #@user = User.new
    erb(:'users/sign_up')
  end

  post '/users' do
  	@user = User.new(email: params[:email],
                  password: params[:password])
  	erb :index
  end

  run! if app_file == $0
end