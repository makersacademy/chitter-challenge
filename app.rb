require 'sinatra/base'
require './lib/message.rb'
require './lib/account.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/chitter_feed' do
    @peep = Message.all
    erb :chitter_feed
  end

  get '/new_message' do
    erb :new_message
  end

  post '/new_message' do
    Message.add(params[:message])
    redirect '/chitter_feed'
  end

  get '/account' do
    erb :account
  end

  post '/account' do
    Account.create(params[:username], params[:email], params[:password])
    redirect '/account/confirmation'
  end

  get '/account/confirmation' do
    @account = Account.new_account
    erb :confirmation
  end

  run! if app_file == $0
end