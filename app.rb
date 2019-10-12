require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :method_override, :sessions

  get '/' do
    redirect '/home'
  end
  
  get '/home' do
    @csspath = 'main.css'
    @page = :home
    erb :template
  end

  post '/peeps' do
    redirect '/home'
  end
end