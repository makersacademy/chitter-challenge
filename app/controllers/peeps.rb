class Chitter < Sinatra::Base

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    @peep = Peep.create(:post => params[:post], :name => params[:name], :user_name => params[:user_name])
    redirect to('/')
  end

end