
ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'time'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  get '/' do
    @user =  User.first(id: session[:user_id])
    @peep = Peep.all.reverse
    @reply = Reply.all
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
      time = Time.new
      user.peeps << Peep.create(peep: params[:peep_input], time: time.strftime("%H:%M %-d %b %Y"))
      user.save
    else
      flash.keep[:unknown_username] =  'You need to login to peep'
    end
    redirect '/'
  end

  post '/reply' do
    user = User.first(id: session[:user_id])
    peep = Peep.first(id: (params[:peep_id].to_i))
    if user
      time = Time.new
      peep.replies << Reply.create(reply: params[:reply], time: time.strftime("%H:%M %-d %b %Y"), user_id: session[:user_id])
      peep.save
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
