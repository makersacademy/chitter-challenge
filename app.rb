require "sinatra/base"
require "./lib/peep"

class Chitter < Sinatra::Base
  enable :sessions

  get "/" do
    @peeps = Peep.all
    erb(:homepage)
  end

  get "/peep" do
    erb(:peep)
  end

  post "/" do
    p 'testing... testing'
    @peep = Peep.create(peep: params['peep'])
    # erb(:homepage)
    redirect "/"
  end

  run! if app_file == $0
end
