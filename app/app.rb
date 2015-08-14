require_relative '../data_mapper_setup'
require_relative './models/peep'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(text: params[:text], timestamp: params[:timestamp])
    redirect to '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

end