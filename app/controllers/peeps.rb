class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    peep = Peep.new(url: params[:url], title: params[:title])
    # tag_list = params[:tags].split.each do |tag|
    #   peep.tags << Tag.create(name: tag)
    # end
    peep.save
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :new
  end
end