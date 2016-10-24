require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'home'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/view'
  end

  get '/user/register' do
    @user = User.new
    erb :'user/register'
  end

  post '/user/register' do
    @user = User.new( name:                  params[:name],
                      email:                 params[:email],
                      username:              params[:username],
                      password:              params[:password],
                      password_confirmation: params[:password_confirmation]
                    )

    if @user.save
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/register'
    end
  end

  get '/user/sign_in' do
    erb :'user/sign_in'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
run! if app_file == $0
end
