require 'data_mapper'
require 'rubygems'
require 'sinatra'

require_relative 'models/peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    # "hello"
    @peep = session[:peep]
    erb(:index)
  end

  post '/post_peep' do
    @peep = Peep.create(text: params[:message])
    session[:peep] = @peep.text
    p "PEEPPP",@peep
    redirect '/'
  end


  run! if app_file == $0
end
