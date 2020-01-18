require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/peeps/new' do
    session[:peep] = params[:peep]
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = session[:peep]
    erb :peeps
  end
end