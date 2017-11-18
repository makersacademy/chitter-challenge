ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require_relative 'models/user.rb'
require_relative 'models/peep.rb'


class Chitter < Sinatra::Base

  helpers do
    def current_user
      @current_user ||= User.first(email: session[:email])
    end
  end

get '/' do
  erb(:index)
end

post '/' do
  User.first_or_create(email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], username: [:username])
  redirect '/success'
end

get '/success' do
  erb(:success)
end

post '/new_posts' do
  erb(:new_posts)
end

get '/log_in' do
  erb(:log_in)
end

get '/signing_up' do
  erb(:signing_up)
end

post '/chitter' do
  @peeps = Peep.all(:order => [ :time.desc ])
  peep = Peep.create(message: params[:new_peep], time: Time.new)
  erb(:chitter)
end

end
