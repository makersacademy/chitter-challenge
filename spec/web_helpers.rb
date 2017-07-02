

def post_a_peep
  visit('/')
  fill_in "content", with: "this is a test peep"
  click_on("Post Peep")
end

def successive_peep_posts
  2.times {visit('/')
  fill_in "content", with: "this is a test peep"
  click_on("Post Peep")
  sleep 1}
end

def sign_up
  visit('/user/new')
  fill_in "email", with: "j.kingharman@googlemail.com"
  fill_in "name", with: "Jasper KH"
  fill_in "username", with: "JKH"
  fill_in "password", with: "fake"
  fill_in "password_confirmation", with: "fake"
  click_on("Create Account")
end
