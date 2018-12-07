require 'sinatra/base'
require './lib/peep'
require './lib/user'
require_relative './database_connection_setup'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @message = params[:message]
    @peep = Peep.all
    erb :index
  end

  post '/chitter' do
    @message = params[:message]
    @name = params[:name]
    @username = params[:username]
    Peep.add_message(params['message'])

    @peep = Peep.all
    erb :index
  end

  get '/chitter/userlogin' do
    erb :userlogin
  end

  post '/chitter/userlogin' do
    User.login_details(params['name'], params['username'], params['email'], params['password'])
    redirect '/chitter/post'
  end

  get '/chitter/post' do
    erb :post
  end

  get '/chitter/display' do
    erb :display
  end

  get '/chitter/internal' do
    erb :internal
  end

  # post '/chitter/create_new' do
  #   @message = params[:message]
  #   @peep = Peep.all
  #   redirect '/chitter'
  # end
end
