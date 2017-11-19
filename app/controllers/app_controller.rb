class Chitter < Sinatra::Base
  set :public_folder, (Proc.new { File.join(root, 'static') })

  get '/' do
    session[:users] = User.all.map(&:username)
    erb :'home'
  end  
end
