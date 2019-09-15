require 'sinatra/base'
require 'rake'
require 'sinatra/activerecord/rake'
require './database_connection_setup.rb'
require 'sinatra/flash'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/peep' do
    @peeps = Peep.all.order(created_at: :desc)
    erb :index
  end

  post '/peep' do
    Peep.create(text: "#{params['new_peep']}")
    @peeps = Peep.all.order(created_at: :desc)
    erb :index
  end

  get '/peep/sign_up' do
    erb :sign_up
  end

  post '/peep/sign_up' do
    User.create(username: "#{params['username']}",
      name: "#{params['name']}",
      password: "#{params['password']}",
      email: "#{params['email']}")
    flash[:notice] = 'Successfully Signed Up!'
    redirect './peep'
  end

end
