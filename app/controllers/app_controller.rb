class Chitter < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, 'static') }

  get '/' do
  	load_peeps
    erb(:home)
  end  
end
