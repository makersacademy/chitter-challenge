require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base 
  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post 'add-database' do
    User.create(username: params[:username], email: params[:email], password: params[:password])
    redirect('/peep')
  end

  get '/peep' do
    @peeps = Peeps.all.sort_by(&:time).reverse
    erb :peep
  end

  post 'new-peep' do
    Peeps.create(peep: params[:peep], time: Time.now.strftime("%m-%d-%Y %H:%M:%S"))
    redirect('/peep')
  end

  run! if app_file == $0

end
