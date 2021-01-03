require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/chitter.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/peeplist' do
    Peep.new(params[:peep])
    redirect '/peeplist'
  end

  get '/peeplist' do
    @peeplist = ChitterDB.list
    erb :peeplist
  end

end
