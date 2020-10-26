require "pg"

RSpec.configure do |config|
  config.before(:each) do
    DBConnection.exec("TRUNCATE TABLE users RESTART IDENTITY;")
    DBConnection.exec("TRUNCATE TABLE peeps RESTART IDENTITY;")
    User.register(username: "ds.danielh", full_name: "Dan Holmes", email: "dan@gmail.com", password: "hunter2")
  end
end
