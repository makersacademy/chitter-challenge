require 'sinatra'
require "./lib/peep"


class Chitter < Sinatra::Base

  enable :sessions
  attr_reader :username, :new_username

  get '/' do
    # if session[:userame] == nil
      erb(:sign_in)
    # else
      # redirect('/chitter')
    # end
  end

  get '/chitter' do
    @username = session[:username]
    p "username is #{@username}"
    @peeps = Peep.all
    erb(:index)
  end

  post '/log_in' do
    session[:username] = params[:username]
    redirect '/chitter'
  end

  post '/sign_up' do
    p "we have assigned"
    session[:username] = params[:new_username]
    redirect '/chitter'
  end


  get '/peep' do
    erb(:peep)
  end

  post '/new_peep' do
    Peep.create(message: params[:peep], sender: 'claude')
    redirect('/chitter')
  end


end
