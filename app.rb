require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  USERNAME = "TestUser"

  set :port, 6789

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:"peeps/index")
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  post '/peeps' do
    Peep.create(username: USERNAME, content: params[:content])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find(params[:id])
    erb(:"peeps/edit")
  end

  patch '/peeps/:id' do
    Peep.change(params[:id], params[:content])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(params[:id])
    redirect '/peeps'
  end

  run! if app_file == $0
end
