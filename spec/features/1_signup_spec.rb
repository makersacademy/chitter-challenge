# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "FEATURE 1: Signup" do

  scenario "1A) Visit signup page" do
    visit '/signup'
    expect(page.status_code).to eq 200
  end
  scenario "1B) Sign up with email, password, full name and username" do
    visit '/signup'
    fill_in 'user_email', :with => "joebloggs@hotmail.com"
    fill_in 'user_pw', :with => "P@ssw0rd1234"
    fill_in 'user_full_name', :with => "Joe Bloggs"
    fill_in 'user_name', :with => "Joeb"
    click_button 'Sign Up'
    expect(page).to have_content('Sign Up')
  end









end
