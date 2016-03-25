ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :'peeps/index'
  end

  get '/signup' do
    @user = User.new
    erb :'signup/signup'
  end

  post '/signup' do
    @user = User.new(name:params['name'], username:params['username'],email:params['email'], password:params['password'], password_confirmation:params['password_confirmation'])
    if @user.save
      redirect '/'
    else
      flash.now[:notice] = "Passwords did not match."
      erb :'signup/signup'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
