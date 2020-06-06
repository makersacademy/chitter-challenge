require 'sinatra/base'
require './lib/peep'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
   erb :'peeps/new'
 end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect '/'
  end


end
