require 'sinatra/base'
require './lib/peeps.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/feed' do
    @peeps = Peeps.feed
    @user_name = session[:username]
    @peep_post = session[:peepbox]
    erb :feed
  end

  post '/user_name' do 
    session[:username] = params[:username]
    redirect '/feed'
  end

  post '/post_peep' do 
    session[:peepbox] = params[:peepbox]
    Peeps.create(session[:peepbox], session[:username])
    redirect'/feed'
    
  end

  run! if app_file == $0
end