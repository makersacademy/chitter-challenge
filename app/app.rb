ENV['RACK_ENV'] ||= "development"

require_relative 'datamapper_setup'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User.first(id: session[:user_id])
    end
  end

  before(:each) do
    current_user
  end

  get '/' do
    erb(:index)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/create_user' do
    user = User.create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    current_user
    redirect('/peeps')
  end

  get '/log_in' do
    erb(:log_in)
  end

  post '/authentication' do
    user = User.first(username: params[:username])
    session[:user_id] = user.id if user.authenticate(params[:password])
    current_user
    redirect('/login_status')
  end

  get '/login_status' do
    erb(:login_status)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/update_peeps' do
    Message.create(body: params[:message_body], posted_at: Time.now)
    redirect '/peeps'
  end

  get '/peeps' do
    @messages = Message.all
    erb(:peeps)
  end

  post '/log_out' do
    session[:user_id] = nil
    redirect '/'
  end

end
