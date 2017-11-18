class Chitter < Sinatra::Base
  set :public_folder, (Proc.new { File.join(root, 'static') })

  get '/' do
    erb(:home)
  end  
end
