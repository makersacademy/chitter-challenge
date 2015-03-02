require 'rubygems'
require 'sinatra/base'
require 'rack-flash'
require 'sinatra/flash'
require 'data_mapper'
require './app/data_mapper_setup'

require './app/helpers/current_user'
require './app/helpers/date_format'

require './app/controllers/users_controller.rb'
require './app/controllers/cheeps_controller.rb'

class Chitter < Sinatra::Base
  set :views, Proc.new { File.join("./app/views") }
  set :public_folder, Proc.new { File.join("./public") }
  enable :sessions
  use Rack::Flash

  include CurrentUser
  include DateFormat

  get '/' do
    @all_cheeps = Cheep.all.reverse
    erb :index
  end

  get '/users/reset_password' do
    erb :"users/reset_password"
  end

  post '/users/reset_password' do
    token = (1..64).map{('A'..'Z').to_a.sample}.join
    user = User.first(email: params[:email])
    user.password_token = token
    user.password_token_timestamp = Time.now
    user.save
  end

  get '/users/reset_password/:token' do
    @token = params[:token]
    user = User.first(password_token: params[:token])
    if DateTime.now < (user.password_token_timestamp + Rational(1, 24))
      erb :"users/new_password"
    else
      "Your reset password link has expired."
    end
  end

  post '/users/new_password' do
    if params[:password] != params[:password_confirmation]
      flash.now[:errors] = []
      flash.now[:errors] << "Your passwords didn't match. Try again."
      erb :"users/new_password"
    else
      user = User.first(password_token: params[:token])
      user.password = params[:password]
      user.save
      user.update(password_token: nil)
      user.update(password_token_timestamp: nil)
      redirect to('/')
    end
  end

end
