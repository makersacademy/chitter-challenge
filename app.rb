require 'sinatra/base'
require './lib/Chitter.rb'
require './lib/Users.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

    get '/' do
      erb :index
    end

    get '/chitter_feed' do
      p ENV
      @chitter_feed = Chitter_Page.all
      erb :chitter_feed
    end

    post '/chitter_feed_new' do
      Chitter_Page.create(comment: params[:comment])
      redirect '/chitter_feed'
    end

    get '/create_account' do
      erb :"users_new"
    end

    post '/users' do
      User.create(email: params[:email], password: params[:password])
      redirect '/chitter_feed'
    end

    run! if app_file == $0
end
