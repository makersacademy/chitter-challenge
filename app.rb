require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :method_override, :sessions


  get '/' do
    redirect '/home'
  end
  
  get '/home' do
    @peeps = Peep.all.reverse
    @css_path = 'main.css'
    @page = :home
    erb :template
  end

  post '/peeps' do
    @peep = Peep.create(content: params['peep-content'])
    redirect '/home'
  end
end