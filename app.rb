require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    "text"
  end

  get '/chitter' do
    @username = session[:username]
    @peeps = Peep.all
    erb :peeps
  end

  get '/chitter/add_peep' do
    erb :new_peep
  end

  post '/new_peep_data' do
    p session[:username]
    Peep.create(params[:text], session[:username])
    redirect('/chitter')
  end

  get '/new_user' do
    erb :new_user_form
  end

  post '/new_user_data' do
    session[:username] = params[:username]
    redirect('/chitter')
  end

  run! if app_file == $0
end
