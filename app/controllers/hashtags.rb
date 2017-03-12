# class Chitter < Sinatra::Base
#
#   get '/hashtags/:name' do
#     hashtag = Hashtag.first(name: params[:name])
#     @peeps = hashtag ? hashtag.peeps : []
#     erb :'peeps/index'
#   end
#
# end
