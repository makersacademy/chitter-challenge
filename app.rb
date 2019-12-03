require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = Peeps.all

    erb :'index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peeps.create(message: params[:message])
    redirect '/bookmarks'
  end

run! if app_file == $0
end
