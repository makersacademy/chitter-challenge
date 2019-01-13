require 'user.rb'

feature "Sign up" do 
  scenario "User sees able to click a sign up button" do 
    visit '/'
    click_button "Sign up"
  end 

  scenario "User is taken to a signup page" do 
    visit '/'
    click_button "Sign up"
    expect(page).to have_current_path '/signup'
  end

  scenario "Signup page contains header" do 
    visit '/'
    click_button "Sign up"
    expect(page).to have_content "Sign up homepage"
  end

  scenario "Looks for email field on signup homepage" do
    visit "/signup" 
    fill_in :email, with: "test@test.com"
  end

  scenario "Looks for password field on signup homepage" do 
    visit "/signup"
    fill_in :password, with: "123"
  end

  scenario "Looks for name field on signup homepage" do 
    visit '/signup'
    fill_in :name, with: "Michael"
  end

  scenario "Looks for username field" do
    visit '/signup'
    fill_in :username, with: "Michael974"
  end

  scenario "Submit button" do 
    visit '/signup'
    fill_in :name, with: "Thomas"
    fill_in :username, with: "Thomas974"
    fill_in :email, with: "Thomas@test.com"
    fill_in :password, with: "123"
    click_button 'Sign up'
    expect(page).to have_current_path '/signin'
  end
end