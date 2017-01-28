# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "FEATURE 1: Signup" do
  scenario "1A) Visit signup page" do
    visit '/signup'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Sign Up')
  end






end
