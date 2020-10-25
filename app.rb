require 'sinatra/base'
require './lib/peeps'
require './lib/maker'

class ChitterManager < Sinatra::Base

  get '/' do
    @user = Maker.find(session[:maker_id])
    erb :index
  end

  get '/peeps' do
    @maker = Maker.find(session[:maker_id])
    @peeps = Peeps.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.create(message_content: params[:message_content])
    redirect '/peeps'
  end

  get '/maker/new' do
    erb :'maker/new'
  end

  post '/maker' do
    maker = Maker.create(name: params[:name], email: params[:email])
    session[:maker_id] = maker.id
    redirect '/peeps'
  end

  run! if app_file == $0
end