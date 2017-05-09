class Chitter < Sinatra::Base
  get '/' do
    redirect('/home')
  end

  get '/home' do
    @peeps = Peep.all
    flash.now[:notice] = "Welcome to Chitter, #{@user.name}" if @user
    erb(:index)
  end

  get '/peeps/:id' do
    redirect '/home' unless peep_id_exists?
    Peep.save_instance(@peep = Peep.get(params[:id]))
    @author = User.get(@peep.user_id)
    erb(:specific_peep)
  end

  get '/user/:name' do
    @page_owner = User.all(username: params[:name]).first
    erb(:userpage)
  end
end
