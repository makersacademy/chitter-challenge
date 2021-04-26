require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'
require_relative './lib/user'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.new
    erb :index
  end

  get '/view' do
    @peeps = Chitter.all
    erb :view
  end

  get '/new' do
    erb :new
  end

  post '/view' do
    Chitter.create(message: params[:message])
    redirect '/view'
  end

  get '/reverse' do
    @peeps = Chitter.flip
    erb :reverse
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.create(name: params[:name], username: params[:username], 
      email: params[:email], password: params[:password])
    redirect '/'
  end

  run! if app_file == $0
end
