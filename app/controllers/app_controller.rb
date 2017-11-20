class Chitter < Sinatra::Base

  set :public_folder, (Proc.new { File.join(root, 'static') })

  get '/' do
    @user = current_user
    @tweets = Tweet.all(order: [:time.desc])
    erb :'tweets/index'
  end
end
