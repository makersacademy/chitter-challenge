require 'sinatra/base'
require_relative './models/peep'

class ChitterApp < Sinatra::Base 

  enable :sessions

  get '/' do
    @peeps = Peep.list_ordered_peeps
    erb :index
  end

  post '/sign-in' do
    session[:logged_in] = true
    session[:username] = params[:username]
    redirect to '/'
  end

  post '/create-peep' do
    Peep.create(message: params[:message], creator: session[:username])
    redirect to '/'
  end

  post '/sign-out' do
    session[:logged_in] = false
    session[:username] = nil
    redirect to '/'
  end

  run! if app_file == $0
end
