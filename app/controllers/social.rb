class Chitter < Sinatra::Base
  post '*/cheeps/applaud' do
    @user = User.first(id: session[:user_id])
    cheepid = params[:cheepid]
    cheep = Cheep.first(id: cheepid)
    # @user.update!(applause: (@user.applause << cheepid))
    puts @user
    cheep.update(applause: cheep.applause + 1)
    refresh = request.fullpath[0..-15]
    redirect refresh
  end
  get '/users/profiles/:profile' do
    @profile = params[:profile]
    @profile = User.first(username: @profile)
    @cheeps = Cheep.all.select do |cheep|
      cheep.user.username == @profile.username
    end
    @user = User.first(id: session[:user_id])
    erb :'users/profile'
  end
end