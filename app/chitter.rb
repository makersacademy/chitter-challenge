ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @new_peep = false
    @signed_in = false
    @posts = Peep.all
    erb :index
  end
  
  get '/sign_up' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/compose_peep' do
    @new_peep = true
    erb :index
  end

  post '/update_peeps' do
    Peep.new(message: params[:message], time: "#{Time.now.strftime('%H:%M')}").save
    redirect '/'
  end

  run! if app_file == $0
end
