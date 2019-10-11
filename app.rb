require 'sinatra/base'
require './lib/peep'

class PeepManager < Sinatra::Base
  enable :sessions, :method_override


  get '/' do
    erb :homepage
  end

  post '/peepsname' do
    session[:user_name] = params[:user_name]
    redirect '/peeps'
  end

  get '/peeps' do
    @user_name = session[:user_name]
    @peeps = Peep.all
    erb :'index'
  end

  get '/peeps/new' do
    erb :'new'
  end

  post '/postpeeps' do
    time = Time.now.strftime("%I:%M %A %B %d, %Y")
    Peep.create(message: params[:message] + " " + time).to_s
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end
end
