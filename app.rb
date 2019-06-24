require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class ChitterManager < Sinatra::Base

  enable :sessions

  get '/' do
    @peeps=Peep.all
    @username=session[:username]
    erb :'peeps/index'
  end

  get '/new' do
    redirect '/new'
  end

  post '/new' do
    Peep.create(text: params[:text])
    redirect '/'
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    User.create(username: params[:username], password: params[:password])
    session[:username]= params[:username]
    redirect '/'
  end

  run! if app_file == $0
end
