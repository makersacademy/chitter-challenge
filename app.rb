require 'sinatra/base'
require 'pg'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    p ENV
    @peeps = Peep.all
    erb :index
  end

  get '/new-peep' do
    erb :add_new_post
  end

  post '/post-peep'do
    Peep.add(user_handle: params[:user_handle], post: params[:post])
    redirect('/peeps')
  end

  get '/peeps'do
    erb :peeps
  end

  run! if app_file == $0

end
