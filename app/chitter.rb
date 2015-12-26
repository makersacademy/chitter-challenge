ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::Session::Cookie, key: 'rack.session', secret: 'super secret'

  get '/' do
    erb :index
  end

  get '/peeps' do
    user = User.first(id: env["rack.session"][:user_id])
    @username = user[:username]
    erb :peeps
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      env["rack.session"][:user_id] = user.id
      redirect to('/peeps')
    else
      flash.next[:login_fail] = ["Either you've not registered, or your password is wrong"]
      redirect '/'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
