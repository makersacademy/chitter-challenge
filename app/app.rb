ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'sinatra/partial'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    erb :index
  end
  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end
  get '/peeps/new' do
    erb :form
  end
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
        if @user.save
          session[:user_id] = @user.id
          redirect to('/peeps')
        else
          flash.now[:errors] = @user.errors.full_messages
          erb :'users/new'
        end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/peeps')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect '/peeps'

 end

  post '/peeps' do
    if current_user
      peep = Peep.create(title: params[:title], text: params[:text],
      context: params[:context],
      time: Time.now.strftime("%H:%M"),
      date: Time.now.strftime("%d/%m/%y"))
      current_user.peeps << peep
      peep.save
    redirect to('/peeps')
  end
end
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
