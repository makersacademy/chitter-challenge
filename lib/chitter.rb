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

  get '/sign_in' do
    erb :sign_in
  end

  get '/feed' do
    erb :feed
  end

  get '/unauthorized' do
    erb :unauthorized
  end

  run! if app_file == $0
end
