require 'sinatra/base'
require './lib/chitter.rb'

class ChitterWebApp < Sinatra::Base

  enable :sessions, :method_override

  get '/' do
    @peeps = Chitter.all
    erb :index
  end

  post '/peep/new' do
    Chitter.add(text: params[:new_peep])
    redirect '/'
  end

  run! if app_file == $0
end
