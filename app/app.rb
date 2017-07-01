ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './models/peep.rb'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'links/index'
  end

  post '/peeps/new' do
    peep = Peep.create(content: params[:new_peep])
    redirect('/peeps')
  end

  get '/peeps/new' do
    erb :'links/add_peep'
  end

end
