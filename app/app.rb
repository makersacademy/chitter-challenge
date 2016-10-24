require 'sinatra/base'
require 'sinatra/partial'
require 'sinatra/flash'
require './app/models/peep'
require './app/models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
     redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/index'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up' do
    @user = User.new(email: params[:email],
                     name: params[:name],
                     user_name: params[:user_name],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'sign_up'
    end
  end

  get '/sign_in' do
    erb :'/sign_in'
  end

  post '/sign_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/sign_in'
    end
  end

  get '/new_peep' do
    erb :'/new_peep'
  end

  post '/new_peep' do
   if current_user.nil?
     flash.keep[:errors] = ['Please sign in to post a peep']
     redirect('/')
   else
    peep = Peep.create(author: current_user.name, user_name: current_user.user_name, peep_time: Time.now.strftime("%d/%m/%Y %H:%M"), text: params[:new_peep])
    redirect('/')
   end
  end

  delete '/sessions' do
    flash.keep[:notice] = "Goodbye, #{current_user.email}"
    session[:user_id] = nil
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

   run! if app_file == $0

end
