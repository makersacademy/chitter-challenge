ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'welcome'
  end

  get '/create_user' do
    @user = User.new
    erb :create_user
  end

  post '/create_user' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :create_user
    end
  end

  get '/log_in' do
    @user = User.new
    erb :log_in
  end

  post '/log_in' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'log_in'
    end
  end

  delete '/log_out' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Farewell!'
    redirect to '/'
  end

  get '/peeps' do
    @peeps = Peep.all
    @peeps.sort! { |newer, older| older.id <=> newer.id }
    erb :'peeps'
  end

  post '/peeps' do
    peep = Peep.new(peep: params[:peep])
    peep.time = Time.new
    peep.save
    redirect '/peeps'
  end

  get '/new_peep' do
    erb :'new_peep'
  end

  run! if app_file == $0
end
