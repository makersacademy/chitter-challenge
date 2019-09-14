require_relative 'web_helpers'

feature 'Log in' do
  scenario 'test login works, redirects to /peeps' do
    log_in_test
    expect(page).to have_content "Chitter - Get your Daily Peeps"
  end

  scenario 'incorrect password' do
    visit '/'
    fill_in 'Email', with: "Test987@email.com"
    fill_in 'Password', with: "wrong password"
    click_button "Log In"
    expect(current_path).to eq('/')
    expect(page).to have_content "Please check your email or password."
  end

  scenario "email doesn't exist" do
    visit '/'
    fill_in 'Email', with: "Test100000@email.com"
    fill_in 'Password', with: "password987"
    click_button "Log In"
    expect(current_path).to eq('/')
    expect(page).to have_content "Please check your email or password."
  end

  scenario 'cant visit /peeps page without logging in' do
    visit '/peeps'
    expect(current_path).to eq('/')
    expect(page).to have_content "You must log in to see Peeps!"
  end

end