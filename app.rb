require 'sinatra'
require "sinatra/reloader"
require 'sinatra/activerecord'
require_relative './lib/peep'
require_relative './lib/user'
require_relative 'lib/database_connection'
require 'bcrypt'

# Need to edit database_connection later so this would work when deployed
set :database, { adapter: "postgresql", database: "chitter_test" }

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::ActiveRecordExtension
    also_reload 'lib/peep.rb'
    also_reload 'lib/user.rb'
  end

  get '/' do
    @peeps = Peep.all
    return erb(:index)
  end

  get '/new-peep' do
    return erb(:new_peep)
  end

  post '/new-peep' do
    #params[:content]
    peep = Peep.create(content: params[:content])
    return erb(:peeped)
    # Need to add user id of person logged in and the created_date_time
  end

  get '/new-user' do
    return erb(:new_user)
  end

  post '/new-user' do
    user = User.create(
      username: params[:username],
      email: params[:email],
      full_name: params[:full_name],
      password: password_encryption(params[:password])
    )
    return erb(:user_created)
  end

  private
  def password_encryption(password)
    encrypted_password = BCrypt::Password.create(password)
  end
end


