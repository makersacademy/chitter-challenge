class App < Sinatra::Base
  get '/peeps' do
    erb(:'/peeps/peeps')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end
  
  post '/peeps/new' do
    Peep.create(content: params[:content], user: current_user)
    redirect('/peeps')
  end
end
