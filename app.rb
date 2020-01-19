require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps/new' do
    Peeps.post(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
