require 'sinatra/base'
require_relative './lib/chitter_feed'
require './database_connection_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @peeps = ChitterFeed.all

    erb :chitter_feed
  end

  get '/enter_peep' do
    erb :enter_peep
  end

  post '/new_peep' do
    @user_id = User.find_id(params[:username])
    Peep.create(user_id: @user_id, content: params[:peep]) if @user_id
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_details' do
    params[:user_id] = User.create(name: params[:name],
                            username: params[:username],
                            email: params[:email],
                            password: params[:password]).first['id']
    redirect '/account_details'
  end

  get '/account_details' do
    @user = User.detials(user_id: params[:user_id])
    erb :account_details
  end

  run! if app_file == $0
end
