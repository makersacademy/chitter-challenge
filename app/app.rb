ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'


class Chitter < Sinatra::Base
register Sinatra::Flash
enable :sessions
set :session_secret, 'super secret'

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
   @user = User.create(email: params[:email],password: params[:password])
    session[:user_id] = @user.id
    redirect'/peeps'
  end

  get '/sign_out' do
    session[:user_id] = nil
    redirect '/peeps'
  end


  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:error] = "The email or password is incorrect"
      redirect '/log_in'
    end
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
      @new_peep = Peep.create(peep: params[:peep], created_at: Time.now, user_id: current_user.id)
      p @new_peep
    redirect '/peeps'
  end

  get '/peeps' do
     @peeps = Peep.all :order => :created_at.desc
     erb :peeps
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end

  run! if app_file == $0

end
