require 'sinatra/base'
require 'sinatra/flash'

require './lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  before do
    @message = flash[:message]
  end

  get '/user/new' do
    erb :user_new
  end

  post '/user/new' do
    User.create(:email => params['email'])
    flash[:message] = "Welcome #{params['email']}"
    redirect '/feed'
  end

  get '/feed' do
    erb :feed
  end

  run! if app_file == $0
end
