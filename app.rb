require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb:'peeps/index'
  end

  get '/peeps/new' do
    erb:'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params['message'], name: params[:name])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end

  get '/signup' do
    erb:'signup/index'
  end

  post '/signup' do
    User.create(name: params['name'], email: params[:email], password: params[:password])
   redirect '/'
  end


  run! if app_file == $0
end