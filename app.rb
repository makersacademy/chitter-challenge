require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/create' do
    erb :'create/index'
  end

  post '/peeps' do
    $peeps = params[:peep]
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = $peeps
    erb :'peeps/index'
  end

  run! if app_file == $0
end
