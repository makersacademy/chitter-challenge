require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/posts' do
    session[:peep] = params['peep']
    redirect '/posts'
  end

  get '/posts' do
    @peeps = session[:peep]
    erb :posts
  end

  run! if app_file == $0
end
