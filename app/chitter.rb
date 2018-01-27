ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    erb(:index)
  end

  post '/user/new' do
    @user = User.create(username: params[:username],
                email: params[:email],
                password: params[:password])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

  get '/new/peeps' do
    erb(:add_peep)
  end

  post '/peeps' do
    Peep.create(content: params[:new_peep])
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.display_in_reverse_order
    erb(:peeps)
  end

end
