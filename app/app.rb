ENV['RACK_ENV'] ||= 'development'

require 'capybara'
require 'sinatra'
require_relative 'data_mapper_setup'
require_relative './models/peep.rb'
require_relative './models/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get'/users/new' do
    @users = User.all
    @peeps = Peep.all
    erb :'users/new'
  end

  post '/users/index' do
    User.create(email: params[:email],
             password: params[:password])
    session[:user_id] = user.id
    # erb :'/users/index'
  end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end
end

#
# class BookmarkManager < Sinatra::Base
#   get'/links' do
#     @links = Link.all
#     @tags = Tag.all
#     erb :'links/index'
#   end
#
#   get'/links/new' do
#     erb :'links/new'
#   end
#
#   post'/links' do
#     link = Link.create(
#       :title => params[:title],
#       :url => params[:url]
#     )
#     tag = Tag.create(
#       :name => params[:name]
#     )
#     link.tags << tag
#     link.save
#     redirect '/links'
#   end
#
#   get '/tags/:name' do
#     tag = Tag.first(name: params[:name])
#     @links = tag ? tag.links : []
#     erb :'links/index'
#   end
#
# end
