require "sinatra/base"
require "./lib/databaseconnection_setup"
require "./lib/peep"

class Chitter < Sinatra::Base

  get '/' do
    redirect('/chitter')
  end

  get '/chitter' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/chitter' do
    Peep.create(params[:peep_text])
    redirect("/chitter")
  end

end
