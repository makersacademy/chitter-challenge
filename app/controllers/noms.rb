class NomDiaries < Sinatra::Base

  get '/noms' do
    @noms = Nom.all
    erb :'/noms/index'
  end

  get '/noms/new' do
    erb :'noms/new'
  end

  post '/noms' do
    nom = Nom.new(nom: params[:nom], posted: Time.now)
    nom.save
    redirect to('/noms')
  end

end
