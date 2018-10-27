require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require_relative 'chitter_helpers'
require_relative 'database_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  helpers ChitterHelpers

  before do
    current_user
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    if current_peeps.empty?
      flash.now[:message] = 'No peeps posted yet!'
    end
    erb :peeps
  end

  get '/peeps/:id' do
    if current_peeps.empty?
      flash.now[:message] = 'No peeps posted yet!'
    end
    erb :peeps_id
  end

  post '/peeps/:id/new' do
    redirect '/peeps' if Peep.create(params[:peep], params[:id])
    flash.next[:warning] = 'Please enter text before peeping!'
    redirect "/peeps/:id"
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    new_user = User.create(
      params[:email], params[:password], params[:name], params[:username]
    ).first
    session[:id] = new_user['id']
    redirect "/peeps/#{session[:id]}"
  end

  post '/session/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect "/peeps/#{session[:id]}"
    else
      flash.next[:warning] = 'Your email or password is incorrect. Please ' \
        'try again.'
      redirect '/'
    end
  end

  post '/session/destroy' do
    session.clear
    flash.next[:message] = 'You have signed out.'
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
