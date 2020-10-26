require_relative "./app/app"

app = Chitter

# Static files:
files = Rack::File.new("public")

# First try the static files, then "fallback" to the app
run Rack::Cascade.new([files, app], [405, 404, 403])
