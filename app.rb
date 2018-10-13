require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index, :layout => :layout
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(username: params[:username],
      name: params[:name],
      email: params[:email],
      password: params[:password])

    if user.valid?
      session[:current_user] = user
      session[:username] = params[:username]
      redirect '/all_peeps'
    else
      flash[:error] = "Ooops something is missing"
      redirect ('/signup')
    end
  end

  get '/all_peeps' do
    @peeps = Peep.all.reverse
    erb :all_peeps, :layout => :layout
  end

  post '/all_peeps' do
    Peep.create(peep: params[:peep], user_id: session[:current_user].id)
    redirect '/all_peeps'
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    user = User.find_by(username: params[:username],
      password: params[:password])
    if user.present?
      session[:current_user] = user
      session[:username] = params[:username]
      redirect '/login_success'
    else
      flash[:error] = "Wrong username/password"
      redirect '/login'
    end
  end

  get '/login_success' do
    @username = session[:username]
    erb :login_success
  end

  post '/log_out' do
    session[:username] = nil
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
