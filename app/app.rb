require 'sinatra/base'

class Chitter < Sinatra::Application

  enable :sessions

  get '/' do
    erb :index
  end

  post '/user/login' do
    session[:login] = params[:login]
    redirect '/peeps'
  end

  get '/peeps' do
    @username = session[:login]
    erb :peeps
  end

  get '/peeps/new' do
    erb :add_peep
  end

  post '/peeps' do
    Peep.post_peep(params[:peep], session[:login])
  end

  run! if app_file == $0
end