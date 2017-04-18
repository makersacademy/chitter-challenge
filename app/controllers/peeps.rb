class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content])
    params[:tags].split.each do |tag|
      peep.tags << Tag.first_or_create(name: tag)
    end
    peep.save
    redirect '/peeps'
  end

end
