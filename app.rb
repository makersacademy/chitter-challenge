require 'sinatra'
require './lib/peep.rb'
require './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb (:index)
  end

  get '/peep' do
    @first_name = session[:first_name]
    @peep = Peep.all
    erb (:peeps)
  end

  post '/peep_index' do
    session[:first_name] = params[:first_name]
    session[:username] = params[:username]
    User.store(params[:email], params[:password], params[:first_name], params[:last_name], params[:username])
    redirect('/peep')
  end

  post '/peep' do
    Peep.store(params[:peep], session[:username])
    redirect('/peep')
  end



  run! if app_file == $0

end
