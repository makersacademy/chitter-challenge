class Knitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    new_text = params[:text]
    peep = Peep.first_or_create(text: new_text)
    peep.save
    redirect '/peeps'
  end
end
