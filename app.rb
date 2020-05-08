require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    @peep_text = session[:text]
    erb :"index"
  end

  post '/peeps' do
    session[:text] = params[:text]
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  run! if app_file == $0
end
