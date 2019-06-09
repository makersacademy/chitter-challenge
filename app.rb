require 'sinatra/base'
require 'sinatra/activerecord'

current_dir = Dir.pwd
Dir["#{current_dir}/lib/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions
  
  get '/' do
    redirect '/feed' if session[:username]
    @peeps = Peep.all.order(created_at: :desc)
    @error = session[:error]
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/signed_up' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    current_user = User.find_by(username: params[:username])
    session[:username] = current_user.username
    redirect '/feed'
  end

  post '/logged_in' do
    current_user = User.find_by(username: params[:username])
    username_not_found unless current_user
    password_doesnt_match unless current_user.password == params[:password]
    session[:username] = current_user.username
    redirect '/feed'
  end

  get '/feed' do
    @peeps = Peep.all.order(created_at: :desc)
    @username = session[:username]
    erb :feed
  end

  post '/peep' do
    logged_in?
    Peep.create(title: params[:title], content: params[:content], username: session[:username])
    redirect '/'
  end

  get '/logout' do
    session[:username] = nil
    redirect '/'
  end

  def logged_in?
    no_user unless session[:username]
  end

  def username_not_found
    session[:error] = 'We cannot find this username'
    redirect '/'
  end

  def password_doesnt_match
    session[:error] = 'Incorrect Password'
    redirect '/'
  end

  def no_user
    session[:error] = 'You must log in to peep!'
    redirect('/')
  end

  run! if app_file == $0
end
