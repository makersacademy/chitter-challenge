class Chitter < Sinatra::Base
  get '/peep/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    peep = Peep.first_or_create(content: params[:content])
    peep.maker = current_maker
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
end
