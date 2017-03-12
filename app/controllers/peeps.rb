class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/add' do
    erb :add
  end

  post '/peeps' do
      peep = Peep.create(content: params[:peep_content])
      params[:hashtags].split.each do |h|
        peep.hashtags << Hashtag.first_or_create(name: h)
      end
      peep.save
      redirect '/peeps'
  end

end
