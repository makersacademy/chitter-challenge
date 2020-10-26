require 'sinatra/base'
require './lib/peeps'

class  Chitter < Sinatra::Base

  Peeps.create

  get '/' do
    @peeps = Peeps.instance
    @messages = @peeps.messages
    erb :index
  end

  post '/' do 
    @peeps = Peeps.instance
    @peeps.add(params[:peep])
    redirect('/')
  end







  run! if app_file == $0
end