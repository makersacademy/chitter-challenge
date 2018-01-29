ENV['RACK_ENV'] ||= "development"

require 'sinatra/flash'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.first(id: session['user_id'])
    end
  end

  get '/' do
    erb(:index)
  end

  get '/user/new' do
    @user = User.new
    erb(:new_user)
  end

  post '/user/new' do
    @user = User.new(username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:new_user)
    end
  end

  get '/sessions/new' do
    erb(:new_session)
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['Your email or password is incorrect']
      erb(:new_session)
    end
  end

  get '/peeps/new' do
    erb(:add_peep)
  end

  post '/peeps' do
    Peep.create(content: params[:new_peep])
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.display_in_reverse_order
    erb(:peeps)
  end

end
