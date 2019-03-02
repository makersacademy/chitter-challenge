require "sinatra/base"
require "pg"
require_relative './lib/peep'

class PeepManager<Sinatra::Base
  enable :sessions, :method_override

  get "/peeps/new" do
    erb :'peeps/new'
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :index
  end

  post "/peeps" do
    Peep.create(text: params[:post])
  redirect "/peeps"
  end



  run! if app_file == $0
end
