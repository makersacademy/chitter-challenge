class Chitter < Sinatra::Base

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag].downcase)
    @peeps = tag ? tag.peeps : []
    @search_term = params[:tag].downcase
    erb :'peeps/index'
  end

  get '/tags/' do
    redirect '/peeps'
  end

  post '/tags' do
    redirect('/tags/' + params[:tag])
  end

end
