ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :user_sign_up
  end

  post '/signup' do
    if User.count(email: params[:email]) + User.count(username: params[:username]) > 0
      redirect '/signuperror'
    else
    user = User.create(username: params[:username],
                        name: params[:name],
                        email: params[:email],
                        password: params[:password])
    session[:user_id]=user.id
    redirect '/peeps'
    end
  end

  get '/signuperror' do
    erb :sign_up_error
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/postpeep' do
    Peep.create(time: Time.new.to_s,
                name: current_user.name,
                content: params[:peep])
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
