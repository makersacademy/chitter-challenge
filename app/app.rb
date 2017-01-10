require 'sinatra/base'
require 'sinatra/flash'
require_relative './models/user'
require_relative './models/peep'
require_relative 'data_mapper_setup'

class ChitterChatter < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    @peeps = Peep.all.reverse
    erb :index
  end

  get '/sign-up' do
    @user = User.new
    erb :sign_up
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def h(text)
      Rack::Utils.escape_html(text)
    end

    def log_in_user(user_id)
      session[:user_id] = user_id
    end
  end

  post '/users' do
    @user = User.create(
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name],
                        username: params[:username]
                        )

    if @user.save
      log_in_user(@user.id)
      # session[:user_id] = @user.id
      redirect to '/'
    else
      flash.now[:errors] = @user.errors
      erb :sign_up
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    if (user = User.authenticate(params[:email], params[:password]))
      log_in_user(user.id)
      redirect to '/'
    else
      flash.now[:errors] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  post '/peep' do
    peep = Peep.create(peep_text: params[:peep_text], user_id: session[:user_id])
    redirect to '/'
  end

end
