# class Chitter < Sinatra::Base
#
#   get '/' do
#     redirect '/peeps'
#   end
#
#   get '/peeps' do
#     @peeps = Peep.all
#     erb :'peeps/index'
#   end
#
#   post '/peeps' do
#     peep= Peep.create(url: params[:url], title: params[:title])
#     params[:tags].split(', ').each do |tag|
#       link.tags << Tag.first_or_create(name: tag)
#     end
#     link.save
#     redirect '/links'
#   end
#
#   get '/links/new' do
#     erb :'links/new'
#   end
# end
