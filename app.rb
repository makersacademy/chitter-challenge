require 'sinatra/base'

require './lib/peep'

class Chitter < Sinatra::Base

    get '/' do
      @peeps = Peep.all
      erb :'index'
    end

    post '/peeps' do
      Peep.create(params[:peep])
      redirect '/'
    end

    run! if app_file == $0

end
