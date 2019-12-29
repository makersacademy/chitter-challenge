require 'bcrypt'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require_relative 'lib/user'
require_relative 'lib/peep'
require 'json'

class ChitterApp < Sinatra::Base

  configure do
    enable :sessions, :method_override
    register Sinatra::Flash
  end

  before do
    begin
      @user = User.find(session[:user_id])
    rescue StandardError
      @user = ""
    end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    encrypted_password = BCrypt::Password.create(params[:'new-password'])

    user_email = User.where(email: params[:'new-email']).first
    if user_email
      flash[:notice] = 'The supplied email address is already in use'
      redirect '/users/new'
    end

    user_grip = User.where(grip: params[:'new-grip']).first
    if user_grip
      flash[:notice] = 'The supplied grip id is already in use'
      redirect '/users/new'
    end

    user = User.create({ first_name: params[:'first-name'], 
      surname: params[:surname], 
      email: params[:'new-email'], 
      grip: params[:'new-grip'], 
      password: encrypted_password 
    })
    
    session[:user_id] = user.id
    redirect '/peeps'
  end

  post '/sessions/new' do
    user = User.where({ email: params[:email] }).first
    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Could not sign in, please check your email or password'
      redirect '/'
    end
  end

  get '/peeps' do
    @peeps = Peep.all.order(created_at: :desc)
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/new' do
    @peep = @user.peeps.create(content: params[:content])
    redirect '/peeps'
  end

end
