ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

require_relative 'models/peep'
require_relative 'models/user'


class Chitter < Sinatra::Base
enable :sessions
set :session_secret, 'super secret'


  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
   user = User.create(email: params[:email],password: params[:password])
   @email = params[:email]
    session[:user_id] = user.id
    redirect'/peeps'
  end

  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], created_at: Time.now)
    redirect '/peeps'
  end

  get '/peeps' do
     @peeps = Peep.all :order => :created_at.desc
     erb :peeps
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end

  run! if app_file == $0

end
