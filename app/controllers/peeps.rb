class Chitter < Sinatra::Base

  post '/peeps' do
    @peep = Peep.create(:post => params[:post], :name => params[:name], :user_name => params[:user_name])
    redirect to('/')
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

end