require 'sinatra/base'
require_relative './models/data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/' do
    erb :sign_up
  end

  post '/user' do
    user = User.create(name: params[:name], username: params[:username],
                e_mail: params[:e_mail], password: params[:password])
    session[:id] = user.id
    erb :peep
  end

  post '/peep' do
    @new_peep = params[:new_peep]
    erb :peep
  end

  run! if app_file == $0

end
