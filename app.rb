require 'sinatra/base'
require './lib/peep'


class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end


  get '/peeps/add' do
    erb :'peeps/add'
  end


  post '/peeps' do
    Peep.create(params['text'])
    redirect '/peeps'
  end


  delete '/peeps/:id' do
    Peep.delete(params[:id])
    redirect '/peeps'
  end


run! if app_file == $0
end
