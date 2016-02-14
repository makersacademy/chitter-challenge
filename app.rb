ENV['RACK_ENV'] ||= 'development'

require 'sinatra/flash'
require 'sinatra/base'
require_relative 'database_mapper_setup'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  register Sinatra::Flash

enable :sessions
set :session_secret, 'super secret'

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  get '/' do
    redirect('/homepage')
  end

  get '/homepage' do
    @peeps = Peep.all
    erb :homepage
  end

  post '/homepage' do
    Peep.create(text: params[:peep])
    redirect('/homepage')
  end

  get '/new-peep' do
    erb :new_peep
  end

  get '/users/new' do
    @user = User.new
    erb :new_user
  end

  post '/users' do
  @user = User.create(email: params[:email],
		password: params[:password],
		password_confirmation: params[:password_confirmation],
		name: params[:name],
		user_name: params[:user_name])
    if @user.save
    session[:user_id] = @user.id
    redirect to('/homepage')
    else
      flash.now[:notice] = "Sorry password & confirmation do not match!"
      erb :new_user 
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
