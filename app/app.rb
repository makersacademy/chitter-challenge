ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/users' do
    erb(:login)
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    redirect '/peeps'
  end

  post '/users/new' do
    name = params[:name]
    email = params[:email]
    password = params[:password]
    User.create(name: name, email: email, password: password)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:peeps)
  end

  post '/peeps' do
    peepbody = params[:peepbody]
    Peep.create(body: peepbody)
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb(:new_peep)
  end
end
