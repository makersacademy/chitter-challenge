require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/register' do
    erb :register
  end
  
  get '/feed' do
    @peeps = Peep.order("created_at DESC").all
    erb :feed
  end

  post '/peep' do
    Peep.create({ content: params[:content] })
    redirect('/feed')
  end

  run! if app_file == $0
end