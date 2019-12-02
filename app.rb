require 'sinatra/base'

require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

    get '/' do
      @peeps = Peep.all
      erb :'index'
    end

    post '/peeps' do
      Peep.create(params[:peep])
      redirect '/'
    end

    post '/sign-up' do
      erb :'sign_up'
    end

    post '/sign-up-complete' do
      User.create(params[:author_name], params[:author_handle], params[:email], params[:password])
      redirect '/sign-up'
    end

    get '/sign-up' do
      @new_user = User.all.last
      erb :'sign_up_complete'
    end

    run! if app_file == $0

end
