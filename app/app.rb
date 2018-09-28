require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'welcome to Chitter'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peeps' do
    # p 'form submitted'
    p @peep = params[:peep_text]
    # redirect('/peeps')
  end

  get '/peeps' do
    erb(:peeps)
  end
  run! if app_file == $0
end 