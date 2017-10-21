require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    Peep.create(message: params[:message])
    redirect '/peeps'
  end
end
