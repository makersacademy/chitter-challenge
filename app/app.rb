ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

require_relative 'models/peep'


class Chitter < Sinatra::Base


  get '/peeps/new' do
    erb :new
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], created_at: Time.now)
    redirect '/peeps'
  end

  get '/peeps' do
     @peeps = Peep.all :order => :created_at.desc
     erb :peeps
  end
  
  run! if app_file == $0

end
