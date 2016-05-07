require 'sinatra/base'
require './app/models/peep'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    @peeps = Peep.all
    erb :'posts/view_posts'
  end

  run! if app_file== $0

end
