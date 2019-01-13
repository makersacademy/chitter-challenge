ENV["RACK_ENV"] ||= 'development'

require 'data_mapper'
require 'pry'
require 'sinatra/base'
require 'sinatra/flash'

require_relative'./lib/user'
require_relative'./lib/peep'
load './config/datamapper_setup.rb'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :method_override, true

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/error'
    end
  end

  post '/signup' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       username: params[:username])

    redirect '/error' unless user.valid?

    session[:user_id] = user.id
    flash[:signup_success] = 'You signed up successfully!'
    redirect '/profile'
  end

  get '/profile' do
    @peeps = Peep.all
    if signed_in?
      erb :profile
    else
      redirect 'signin'
    end
  end

  post '/peep' do
    peep = Peep.create(:content => params[:peep])
    peep.save
    redirect '/profile'
  end

  get '/error' do
    erb :error
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end

  run! if app_file == $0

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

end
