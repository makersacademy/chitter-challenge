ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/sign_up' do
    erb :sign_up
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    p params
    Peep.create(peep_text: params[:peep_text])
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peep
  end
end
