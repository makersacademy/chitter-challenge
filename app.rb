require 'sinatra/base'
require './lib/peeps'
require './lib/maker'

class ChitterManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/home' do
    @maker = Maker.find(session[:maker_id])
    @peeps = Peeps.all
    erb :home
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peeps.create(message_content: params[:message_content], name: params[:name])
    redirect '/home'
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