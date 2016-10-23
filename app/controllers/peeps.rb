class Chitter < Sinatra::Base

  get '/' do
    @users = User.all
    # @peeps = Peeps.all
    erb :index
  end

  post '/new_peep' do
    peep = Peep.new(title: params[:title], url: params[:url])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect('/links')
  end

  get '/links' do
    @links = Peeps.all
    erb :links
  end

  get '/links/new' do
    erb :links_new
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end
end
