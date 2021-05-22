require 'sinatra/base'
require_relative './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/peeps' 
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(text: params[:text], posted: Time.now.strftime("%F %T"))
    redirect '/peeps'
  end
end