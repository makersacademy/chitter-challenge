require 'data_mapper'
require 'sinatra/base'

require_relative '../lib/maker.rb'
# putting this one second because DataMapper docs say that belongs_to classes should be run after the class they belong to.
require_relative '../lib/peep.rb'
require_relative '../lib/ORM.rb'


class Chitter < Sinatra::Base

  get '/' do
    'hello world'
  end

end

# # routes.rb
# current_dir = Dir.pwd
# Dir["#{current_dir}/models/*.rb"].each { |file| require file }
#
# get '/articles' do
#   ...
#   @articles = Article.all
#   ...
# end
#
#
# get '/articles/:id' do
#   ...
#   @article = Article.get(params[:id])
#   ...
# end
#
# post '/articles' do
#   ...
#   @article = Article.create(params[:article])
#   ...
# end
#
# put '/articles/:id/publish' do
#   ...
#   @article = Article.get(params[:id])
#   @article.publish!
#   ...
# end
#
# delete '/articles/:id' do
#   ...
#   Article.get(params[:id]).destroy
#   ...
# end
