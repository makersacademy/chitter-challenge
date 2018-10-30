require 'sinatra/base'
require 'shotgun'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/login_in' do
    erb :login_in
  end

  get '/feed' do
    erb :feed
  end

  get '/post' do
    erb :post
  end

  get '/unauthorized' do
    erb :unauthorized
  end

  run! if app_file == $0
end
