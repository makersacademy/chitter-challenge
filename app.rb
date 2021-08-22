# require 'sinatra/base'
# require 'sinatra/reloader'

# class ChitterChallenge < Sinatra::Base
#   configure :development do
#     register Sinatra::Reloader
#   end

#   get '/status/newstatus' do
#     erb :index
#   end

#   post '/status' do
#     Peep.create(peep: params[:status])
#     @peeps = Peep.all
#     erb :status
#   end


#   run! if app_file == $0
# end