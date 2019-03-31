require 'sinatra/base'
require './lib/message.rb'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :welcome_page
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    # User.sign_up(fullname: params[:fullname], email: params[:email], username: params[:username], password: params[:password])
    redirect '/chitter/new'
  end

  get '/chitter_feed' do
    @peeps = Message.all
    erb :chitter_feed
  end

  get '/chitter/new' do
    erb :'/chitter/new'
  end

  post '/chitter/new' do
    @peep = Message.post(username: params[:username], message: params[:message])
    redirect '/chitter_feed'
  end

  run! if app_file == $0
end
