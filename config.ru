require_relative './app/app.rb'

map "/public" do
  run Rack::Directory.new("./public")
end

run Fitter
