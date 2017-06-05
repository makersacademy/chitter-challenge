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
    @messages = Message.all
    erb(:index)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/create_user' do
    user = User.create(username: params[:username],
                       password: params[:password],
                       name: params[:name],
                       email: params[:email])
    session[:user_id] = user.id
    current_user
    redirect('/account_creation')
  end

  get '/account_creation' do
    erb(:account_creation)
  end

  get '/log_in' do
    erb(:log_in)
  end

  post '/authentication' do
    session[:user_id] = User.authenticate(params[:username], params[:password])
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
    Message.create(body: params[:message_body],
                   posted_at: Time.now,
                   user_id: current_user.id)
    redirect '/'
  end

  post '/log_out' do
    session[:user_id] = nil
    redirect '/'
  end

end
