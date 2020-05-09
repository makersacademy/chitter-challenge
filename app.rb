require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/peeps' do
    @result = Peep.all
    erb(:index)
  end

  get '/peeps/new' do
    erb(:new)
  end

  post '/peeps' do
    p "Form data submitted to the /peeps route!"
    Peep.add(peep: params[:peep])
    redirect('/peeps')
  end

  get '/peeps/signup' do
    erb(:signup)
  end

  post '/peeps/signup' do
    p "Form data submitted to the /signup route!"
    User.add(name: params[:name], username: params[:username], password: params[:password])
    redirect('/peeps')
  end
end
