require "sinatra"
require "./lib/chitter.rb"

class Chits < Sinatra::Base

  get '/' do
    @peeps = Chitter.list
    # "@peeps in get / route #{@peeps}"
    erb :index
  end

  post '/' do
    Chitter.post(params[:peep], DateTime.now)
    redirect '/'
  end

  run! if app_file == $0

end
