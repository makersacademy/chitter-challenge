

class Chitter < Sinatra::Base

 get '/' do
   redirect('/peep/new')
 end

  get "/peep/new" do
    erb :'peep/new'
  end

  post "/peep" do
    Peep.create(content: params[:content])
    redirect('/peep/index')
  end

  get '/peep/index' do
      @peeps = Peep.all
      erb :'peep/index'
  end

end
