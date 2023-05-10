require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require_relative 'lib/peep.rb'
require_relative 'lib/user.rb'
require_relative 'lib/tag.rb'

class Application < Sinatra::Base
  # This refreshes the app code without having to restart the server with each change
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @peeps_reverse_chron_order = Peep.order(created_at: :desc)
    return erb(:index)
  end

  get '/signup' do
    return erb(:sign_up)
  end

  get '/user/page' do
    return erb(:user_page)
  end

  get '/user/compose_peep' do
    return erb(:compose_peep)
  end
  
  post '/new-user' do
    @name = params[:name]
    email_address = params[:email_address]
    password = params[:password]

    User.create(name: @name, email_address: email_address, password: password)

    return erb(:sign_up_confirmation)
  end

end
