require 'sinatra/base'
require_relative './lib/chitter'
require_relative './lib/user'
class ChitterManager < Sinatra::Base
  enable :sessions

  before do
    @chitter = Chitter
    @user = User
  end

  get '/' do
    erb :form
  end

  post '/type_peeps' do
    @user.create(username: params[:username], password: params[:password])
    erb :index
  end

  post '/peeps' do
    @chitter.create(peep: params[:peeps])
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $0
end
