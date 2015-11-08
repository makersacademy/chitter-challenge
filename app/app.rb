ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    if current_user.nil?
      erb :'/sign_up_and_log_in/user_sign_up'
    else
      redirect('/peeps')
    end
  end

  post '/signup' do
    users = User.all
    if !(User.get(email: params[:email]).nil?) # + User.count(username: params[:username]) > 0
      redirect '/signuperror'
    else
    user = User.create(username: params[:username],
                        name: params[:name],
                        email: params[:email],
                        password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
    end
  end

  get '/signuperror' do
    erb :'sign_up_and_log_in/sign_up_error'
  end

  post '/login' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      redirect '/wrongpassword'
    end
  end

  get '/wrongpassword' do
    erb :'sign_up_and_log_in/wrong_password'
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps'
  end

  post '/postpeep' do
    Peep.create(time: Time.new,
                content: params[:peep],
                name: current_user.name)
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
