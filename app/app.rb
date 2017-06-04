ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'not so super secret'
  register Sinatra::Flash

  get '/' do
    erb :sign_in
  end

  post '/sign_in' do
    user = User.authenticate(email: params[:email], password: params[:password])
    redirect '/peeps'
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.create(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps/new' do
    erb :'peeps/new_peep'
  end

  post '/peeps' do
    new_peep = Peep.create(message: params[:message])
    new_peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/peeps_index'
  end

  run! if app_file == $0

end
