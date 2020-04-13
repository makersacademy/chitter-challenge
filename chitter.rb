require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @current_peeps = Peep.all
    @handle = session[:handle]
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post "/sign_in_details" do
    session[:handle] = params[:handle]
    User.create(name: params[:name], handle: params[:handle], email: params[:email], password: params[:password])
    redirect '/'
  end

  post "/send_compose_peep" do
    redirect '/compose_peep'
  end

  get '/compose_peep' do
    erb :send_peep
  end

  post "/submit_peep" do
    Peep.create(username: params[:username], peep: params[:peep_text])
    redirect '/'
  end
end
