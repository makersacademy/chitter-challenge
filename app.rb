require 'sinatra/base'
require './lib/peep'

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
    @user_peep = session[:peep]
    @peeps = Peep.view
    erb :peeps
  end
end