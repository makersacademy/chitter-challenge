ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'

require_relative 'controllers/peep_controller'
require_relative 'controllers/session_controller'

# require_relative 'models/user.rb'
# require_relative 'models/peep.rb'

require_relative 'helpers'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :root, File.dirname(__FILE__)

  helpers Helpers

  get '/users/sign-up' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
