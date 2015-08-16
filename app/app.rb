require 'sinatra/base'
require 'sinatra/flash'
require_relative '../data_mapper_setup'



class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end
  end

  get '/' do
    erb :home
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(user: params[:user], content: params[:content])
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
  User.create(email: params[:email],
              password: params[:password],
              username: params[:username],
              realname: params[:realname])
              session[:user_id] = user.id
  redirect to('/peeps')

end

  run! if app_file == $0
end
