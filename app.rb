require 'sinatra'
require 'sinatra/flash'
require 'uri'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/timeline' do
    @peeps = Peep.all
    erb :timeline
  end

  post '/timeline/new' do
    Peep.create(text: params[:text])
    redirect '/timeline'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    unless User.create(name: params[:name], 
                      username: params[:username], 
                      email: params[:email], 
                      password: params[:password]
                      )
      flash[:notice] = 'You must submit a valid email address.' 
    else
      redirect '/signed_up'
    end
  end

  get '/signed_up' do
    erb :signed_up
  end

  run! if app_file == $0
end
