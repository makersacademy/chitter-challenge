require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base

  get '/posts/all' do
    @peeps = Peep.all
    erb(:'posts/all')
  end

  post '/posts/new' do
    peep = Peep.create(content: params[:new_peep])
    redirect('/posts/all')
  end

  get '/posts/new' do
    erb(:'posts/new')
  end

end
