require 'sinatra'
require "sinatra/reloader" if development?
require 'pg'
require './lib/peep'
require './lib/user'
require './database_connection_setup'
require 'sinatra/flash'
require 'action_view'
require_relative './controllers/peep_controller'
require_relative './controllers/user_controller'

include ActionView::Helpers::DateHelper

class Chitter < Sinatra::Base

  use PeepController
  use UserController

  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/reply' do
    @peep = Peep.find_by_id(id: params[:peep_id])
    erb :reply
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:notice] = 'Please check your email or password.'
    end
    redirect('/peeps')
  end

  post '/sessions/delete' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  # Start the server if this file is executed directly 
  run! if app_file == $0
end
