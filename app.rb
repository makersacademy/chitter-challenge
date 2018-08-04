require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/username' do
    session[:username] = params[:username]
    redirect ('/feed')
  end

  get '/feed' do
    @username = session[:username]
    @peep = params[:peep]
    erb(:feed)
  end

  run! if app_file == $0
end
