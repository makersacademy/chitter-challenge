# require "rom"

# rom = ROM.container(:sql, 'postgres://localhost:5432/chitter', username: 'calumwilmot', password: 'postgres') do |config|
#   config.relation(:users) do
#     schema(infer: true)
#     auto_struct true
#   end
# end

# users = rom.relations[:users]

# users.changeset(:create, email: "test@test.com", password: "password").commit

# test = users.where(email: "test@test.com").one

# puts test

require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/peep_repository.rb'
require_relative 'lib/signup_repository.rb'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    repo = PeepRepository.new
    @peeps = repo.all
    return erb(:peeper)
  end

  get '/signup' do
    return erb(:signup)
  end

  post '/signup' do
    repo = SignupRepository.new
    new_user = User.new
    new_user.email = params[:email]
    new_user.password = params[:password]
    repo.create(new_user)
  end

  post '/peep' do
    repo = PeepRepository.new
    content = params[:content]
    repo.create(content)
    return erb(:peeper)
  end

#

  post '/login' do
    repo = SignupRepository.new

    login_email = params[:email]
    login_password = params[:password]

    user = repo.login(login_email, login_password)
    if user != nil
        return erb(:peeper)
    end
    return erb(:failed_login)
  end
end
