ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
     def current_user
       @current_user ||= User.get(session[:user_id])
     end
  end

  get '/' do
    redirect '/main'
  end

  get '/users/new' do
    erb :'users/sign_up_form'
  end

  post '/users' do
    user = User.create( name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/sign_up_form'
    end
  end

  get '/sessions/new' do
    erb :'users/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = ['The email or password is incorrect']
      erb :'users/sign_in'
    end
  end

  get '/sessions/log_out' do
    erb :'users/log_out', layout: :layout_empty
  end


  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/main'
  end

  get '/main' do
    current_user
    peep = Peep.all(:order => [ :created_at.desc ])
    @peeps = peep ? peep : []
    erb :main
  end

  post '/peep/new' do
    peep = Peep.create(peep_content: params[:peep_content], user: current_user)
    current_user.peeps << peep
    redirect to '/main'
  end


end
