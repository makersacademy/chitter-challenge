class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = (params[:search] ? search(params[:search]) : Peep.all)
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if session[:user_id].nil?
      flash.now[:notice] = "You must be logged in to post a peep"
      redirect '/peeps'
    end
    erb :'peeps/new'
  end

  post '/peeps' do
    if params[:peep_content] != ""
      create_peep(params)
      redirect to('/peeps')
    else
      flash.now[:notice] = "Please enter a message for your peep"
      erb :'/peeps/new'
    end
  end

  post '/peeps/delete' do
    Peep.get(params[:id]).destroy
    flash.now[:notice] = "Peep deleted."
    redirect '/peeps'
  end

end
