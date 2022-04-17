require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps' do
    @all_peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    new_peep = Peep.create(peep: params[:peep], user_id: session[:user_id])
    new_peep.save
    redirect :'/peeps'
  end

 


  run! if app_file == $0
end