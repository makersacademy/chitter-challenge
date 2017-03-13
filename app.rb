require 'sinatra/base'
require_relative 'app/models/peep'
require_relative 'app/models/user'
require_relative 'app/datamapper_setup'

class Chitter < Sinatra::Base

  ENV['RACK_ENV'] ||= 'development'
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    erb :home
  end

  get '/signup' do
    erb :new_user
  end

  get '/signin' do
    erb :sign_in
  end

  post '/users/new' do
    user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    session['user_id'] = user.id
    redirect '/peeps'
  end

  post '/users/signin' do
    user = User.authenticate(params[:email], params[:password])
    session['user_id'] = user.id
    redirect '/peeps'
  end

  delete '/sessions' do
    session['user_id'] = nil
    redirect '/signout'
  end

  get '/signout' do
    erb :signout
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps_list
  end

  get '/peeps/new' do
    erb :'new_peep'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    current_user.peeps << peep
    current_user.save
    redirect '/peeps'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session['user_id'])
    end
  end

end
