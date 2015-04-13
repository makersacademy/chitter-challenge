require_relative '../models/ranker'

class Chitter < Sinatra::Base
  post '*/cheeps/applaud' do
    @user = User.first(id: session[:user_id])
    cheepid = params[:cheepid]
    cheep = Cheep.first(id: cheepid)
    Applause.create(user_id: session[:user_id], cheep_id: cheepid)
    puts refresh = request.fullpath[0..-15]
    if refresh == '/users/profiles/'
      refresh << "#{session[:profile]}"
    else
      refresh = session[:page]
    end
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
    @profile = request.fullpath[16..-11]
    @profile = User.first(username: @profile)
    @user = User.first(id: session[:user_id])
    @people = @profile.followed_people
    @sentence = " is following:"
    erb :'users/follows'
  end

  get '*/followers' do
    @profile = request.fullpath[16..-11]
    @profile = User.first(username: @profile)
    @user = User.first(id: session[:user_id])
    @people = @profile.followers
    @sentence = " is followed by:"
    erb :'users/follows'
  end

  get '/following-cheeps' do
    session[:page] = '/following-cheeps'
    @user = User.first(id: session[:user_id])
    @cheeps = Cheep.select do |cheep|
      @user.followed_people.include?(cheep.user)
    end
    erb :index
  end

  get '/trending' do
    session[:page] = '/trending'
    @user = User.first(id: session[:user_id])
    @cheeps = Cheep.all
    @cheeps = Ranker.rank(@cheeps)
    erb :index
  end
end
