require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/user'
require_relative 'lib/post'
require_relative 'lib/reply'


class ChitterApplication < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  # register Sinatra::Reloader

  configure :development do
    register Sinatra::Reloader
    register Sinatra::ActiveRecordExtension
  end

  get '/' do
    # @posts = Post.order(created_at: :desc)
    @posts = Post.joins(:user).select(:content, :created_at, :'users.username').order(created_at: :desc)
    
    # @pass_me = results.map {|row| row.created_at.strftime("%F / %H:%M")}
    erb :index
  end
end