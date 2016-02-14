
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @user =  User.first(id: session[:user_id])
    @peep = Peep.all.reverse
    # @peep.each do |peep|
    #   p users_id = PeepUser.first(peep_id: peep.id).user_id
    #   p username = User.first(id: (PeepUser.first(peep_id: peep.id).user_id)).username
    # end
    # # @username = User.all
    # # @link = UserPeep.all
    erb :'/home'
  end

  get '/sign_up' do
    erb :'/sign_up'
  end

  post '/sign_up_complete' do
    user = User.new(name: params[:name], email: params[:email], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'sign_up'
    end
  end

  post '/log_in' do
    user =  User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash.keep[:unknown_username] =  "Invalid Username or Password"
    end
    redirect '/'
  end

  post '/post_peep' do
    user = User.first(id: session[:user_id])
    if user
      user.peeps << Peep.create(peep: params[:peep_input])
      user.save
    else
      flash.keep[:unknown_username] =  'You need to login to peep'
    end
    redirect '/'
  end

  delete '/goodbye' do
    session[:user_id] = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
