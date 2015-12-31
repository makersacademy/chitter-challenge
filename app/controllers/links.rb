class BookmarkManager < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
   link = Link.create(url: params[:url], title: params[:title])
   params[:tags].split.each do |tag|
     link.tags << Tag.create(name: tag)
   end
   link.save
   redirect to('/links')
 end

  get '/links/new' do
    erb :'links/new'
  end

end
