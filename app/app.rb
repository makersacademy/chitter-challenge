ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/models/database_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def email
      @email = session[:email]
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/user/new' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       name: params[:name],
                       username: params[:username])
    if user.id.nil?
      flash.next[:login_error] = 'Password and confirmation password do not match'
      session[:email] = params[:email]
      redirect '/signup'
    else
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/peeps' do
    @peeps = Peep.all(order: :created_at.desc)
    erb :peeps
  end

  get '/peeps/new' do
    erb :new_peep
  end

  post '/peeps/sending_peep' do
    Peep.create(message: params[:peep])
    redirect '/peeps'
  end
end
