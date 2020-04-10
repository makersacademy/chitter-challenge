require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  
  get '/' do
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
    session[:submit_peep] = params[:peep_text]
    redirect '/'
  end
end
