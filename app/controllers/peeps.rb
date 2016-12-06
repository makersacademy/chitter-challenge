class Chitter < Sinatra::Base

  post '/peep' do
    peep = Peep.create(message: params[:user_message], user_id: get_current_user.id)
    get_current_user.peeps << peep
    redirect("/peeps")
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end
end
