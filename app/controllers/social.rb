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
    @profile = User.first(username: profile)
    @user.follow(@profile)
    refresh = request.fullpath[0..-7]
    refresh << profile
    redirect refresh
  end

  get '*/following' do
    @user = User.first(id: session[:user_id])
    @following = @user.followed_people
    erb :'users/following'
  end

  get '/following-cheeps' do
    @user = User.first(id: session[:user_id])
    @cheeps = Cheep.select do |cheep|
      @user.followed_people.include?(cheep.user)
    end
    erb :index
  end
end




