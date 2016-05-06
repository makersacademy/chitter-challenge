class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    # tag_list = params[:tags].split.each do |tag|
    #   link.tags << Tag.create(name: tag)
    # end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :new
  end
end