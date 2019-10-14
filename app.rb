require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './helpers/session_helpers'

set :database_file, 'config/database.yml'

Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  include SessionsHelper
  enable :sessions, :method_override

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.order(created_at: :desc)
    erb :index
  end

  post '/peeps/new' do
    @peep = Peep.create(content: params[:content], user_id: current_user.id)
    redirect '/peeps'
  end

  get '/signup' do
    erb :signup
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.where(username: params[:username]).first
    password = params[:password]
    if user && user.authenticate(password)
      log_in(user)
      redirect '/peeps'
    else
      flash[:notice] = "Username or password is invalid"
      redirect '/login'
    end
  end

  post '/logout' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps')
  end

  post '/signup' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    log_in(user)
    redirect '/peeps'
  end

  run! if app_file == $0

end

