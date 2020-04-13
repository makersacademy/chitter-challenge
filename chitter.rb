require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @current_peeps = Peep.all
    #line below now won't work as I am inserting to database
    @new_peep = session[:submit_peep]
    erb :index
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
