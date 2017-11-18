ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require_relative 'models/user.rb'
require_relative 'models/peep.rb'


class Chitter < Sinatra::Base

get '/' do
  erb(:index)
end

post '/' do
  user = User.first_or_create(email: params[:email], password: params[:password], first_name: params[:firsrt_name], last_name: params[:last_name], username: [:username])
  redirect '/success'
  redirect '/'
end

get '/success' do
  erb(:success)
end

get '/new_posts' do
  erb(:new_posts)
end

get '/signing_up' do
  erb(:signing_up)
end

post '/chitter' do
  @peeps = Peep.all(:order => [ :time.desc ])
  peep = Peep.create(message: params[:new_peep], time: Time.new)
  peep.save
  erb(:chitter)
end

end
