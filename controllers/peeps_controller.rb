# require 'sinatra/base'
# require 'sinatra/reloader'
# require './lib/peeps_repository'

# class Peeps < Sinatra::Base
#   configure :development do
#     register Sinatra::Reloader
#     set :public_folder, 'public'
#     set :views, 'views'
#   end
#     post '/peep' do
#     return erb(:peep)
#     end

#     get '/peeps' do
#       return erb(:peeps)
#     end

# end

