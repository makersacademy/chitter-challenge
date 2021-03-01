require 'sinatra/base'
require 'bcrypt'
require './get_connection.rb'
require 'sinatra/flash'
require 'date'
require './lib/user.rb'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  before do
    @user = User.find(id: session[:user])
    @peeps = Peep.all
  end

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    erb(:'peeps/index')
  end

  get '/users/new' do
    erb(:'users/new')
  end

  get '/session/new' do
    erb(:'session/new')
  end

  post '/session' do
    @user = User.authenticate(username: params[:username], password: params[:password])
    flash[:authentication_failed] = "I'm sorry, those details don't match our records" unless @user
    session[:user] = @user.id unless @user.nil?
    redirect('/peeps')
  end

  delete '/session' do
    @user = User.authenticate(username: params[:username], password: params[:password])
    flash[:log_out] = "You have successfully signed out of Chitter"
    session[:user] = nil
    redirect('/peeps')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    flash[:credentials_in_use] = "That email or username are already taken, please try again" unless @user
    if @user
      flash[:signup_success] = "Welcome to Chitter, #{@user.name}!"
      session[:user] = @user.id
    end
    redirect('/')
  end

  get '/peeps/new/:id' do
    erb(:'peeps/new')
  end

  post '/peeps/:id' do
    @user_id = params[:id]
    @content = params[:content]
    time = DateTime.now
    @date = time.strftime("%Y-%m-%d")
    @time = time.strftime("%H:%M")
    DBConnection.query("INSERT INTO peeps (content, date, time, user_id) VALUES('#{@content}', '#{@date}', '#{@time}', '#{@user_id}');")
    redirect('/')
  end

  run! if app_file == $0
end
