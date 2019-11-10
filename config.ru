require_relative './app'

map "/public" do
  run Rack::Directory.new("./public")
end

run Bitter