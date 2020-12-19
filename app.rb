require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/peeps' do
    erb :'peeps/index'
  end

  post '/peeps' do
    $message = params[:message]
    redirect '/peeps/1'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/peeps/:id' do
    $message
    erb :'peeps/show'
  end

  # establish server if file run directly
  run! if app_file == $0
end
