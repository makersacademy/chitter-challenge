class Chitter < Sinatra::Base
  post '*/cheeps/applaud' do
    @user = User.first(id: session[:user_id])
    cheepid = params[:cheepid]
    cheep = Cheep.first(id: cheepid)
    Applause.create(user_id: session[:user_id], cheep_id: cheepid)
    refresh = request.fullpath[0..-15]
    refresh << "#{session[:profile]}" if refresh == '/users/profiles/'
    redirect refresh
  end
  get '/users/profiles/:profile' do
    @profile = params[:profile]
    session[:profile] = @profile
    @profile = User.first(username: @profile)
    @cheeps = Cheep.all.select do |cheep|
      cheep.user.username == @profile.username
    end
    @user = User.first(id: session[:user_id])
    erb :'users/profile'
  end
  post '/users/profiles/follow' do
    @user = User.first(id: session[:user_id])
    profile = params[:profile]

    refresh = request.fullpath[0..-7]
    refresh << profile
    redirect refresh
  end
  get '*/following' do

    @following = []
    erb :'users/following'
  end
end