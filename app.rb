require 'sinatra/base'
require './lib/peep'
require 'pg'


class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/post' do
    erb :post
  end

  post '/create-new-link' do
  Peep.create(post: params['post'])
  redirect '/'
end

end
