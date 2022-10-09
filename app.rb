require 'sinatra/base'
require 'sinatra'

class Chitter < Sinatra::Base
  enable :sessions

  get '/chitter' do
    @peep = session[:peep_content]
    erb :index
  end

  get '/chitter/new' do
    erb :new
  end

  post '/chitter' do
    session[:peep_content] = params[:peep_content]
    redirect '/chitter'
  end

  run! if app_file == $0
end
