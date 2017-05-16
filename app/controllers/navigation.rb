class Chitter < Sinatra::Base
  get '/' do
    redirect('/home')
  end

  get '/home' do
    @peeps = Peep.all # Good idiomatic use of instance variables to pass data to views, rather than letting views call directly
    flash.now[:notice] = "Welcome to Chitter, #{@user.name}" if @user # Can't immediately tell where this @user comes from — decreases readability It hink
    erb(:index)
  end

  get '/peeps/:id' do
    redirect '/home' unless peep_id_exists? # Great helper method
    Peep.save_instance(@peep = Peep.get(params[:id])) # This line is a bit odd — why is `Peep.save_instance` here? Why not just `@peep = ...`
    @author = User.get(@peep.user_id)
    erb(:specific_peep)
  end

  get '/user/:name' do
    @page_owner = User.all(username: params[:name]).first
    erb(:userpage)
  end
end
