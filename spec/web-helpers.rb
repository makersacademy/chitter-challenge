require 'rake'

def test_db_initialise
  rake = Rake.application
  rake.init
  rake.load_rakefile
  rake['db:drop'].invoke
  rake['db:setup'].invoke
end

def visit_login_page
  visit('/')
  click_link "Login"
end

def visit_signup_page
  visit('/')
  click_link "Signup"
end

def perform_valid_login
  visit_login_page
  fill_in "username", with: "al123"
  fill_in "password", with: "password123"
  click_on "Submit"
end
