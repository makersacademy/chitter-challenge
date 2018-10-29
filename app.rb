require 'sinatra/base'
require './lib/message.rb'
require './lib/account.rb'
require 'date'
require './lib/database_connection_setup.rb'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @timeline = Message.all
    erb :index
  end

  post '/incoming' do
    Message.create(message: params['message'], time: Time.now)
    redirect '/'
  end

  get '/new_account' do
    erb :new_account
  end

  post '/details' do
    Account.create(first_name: params['first_name'], last_name: params['last_name'], user_name: params['user_name'], password: params[:password], email: params[:email])
    redirect '/'
  end

  run! if app_file == $0
end
