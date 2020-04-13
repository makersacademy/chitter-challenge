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
    username = params[:username]
    peep_text = params[:peep_text]
    connection = PG.connect(dbname: 'chitter_peeps_test')
    connection.exec("INSERT INTO peeps (username, peep, time) VALUES('#{username}', '#{peep_text}', '#{Time.now}');")
    redirect '/'
  end
end
