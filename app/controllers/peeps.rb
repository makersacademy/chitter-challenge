class Chitter < Sinatra::Base
  post '/peep' do
    peep = Peep.create(message: params[:user_message], user_id: get_user_id.id)
    get_user_id.peeps << peep
    redirect("/peeps")
  end

  get '/peeps' do
    @posts = Peep.all
    erb :index
  end
end
