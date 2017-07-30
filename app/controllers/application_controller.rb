class Chitter < Sinatra::Base
  set :public_folder, Proc.new { File.join(root, 'static') }
end
