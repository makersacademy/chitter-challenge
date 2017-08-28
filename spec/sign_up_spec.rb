require './app.rb'
require './database_cleaner.rb'

feature 'Sign up for Chitter' do
  scenario "Before the home page there is a sign up page" do
     visit '/sign_up'
    expect(page.status_code).to eq 200
  end
  scenario "A user can sign up" do
    visit '/sign_up'

     fill_in "username", :with => "Poopie"
     fill_in "password", :with => "demandingcat"

    expect(current_path).to eq '/home'
  end
end

# feature "Error is raised if sign up is not done"

#feature "Home page contains correct username"
