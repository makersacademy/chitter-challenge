require 'sinatra/base'
require './lib/chitter.rb'

class ChitterManager < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/make_a_peep' do
    erb :make_a_peep
  end

  post '/make_a_peep' do
    Chitter.new_peep(params[:user_name], params[:peep])
    erb :make_a_peep
  end

  get '/view_peeps' do
    @allpeeps = Chitter.all
    erb :view_peeps
  end

end
