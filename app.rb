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
    results = Post.all
    # results.each {|row| p row.created_at.strftime("%F / %H:%M")}
  end
end