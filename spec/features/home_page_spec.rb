require "spec_helper.rb"

feature "homepage welcomes users" do

  scenario "has a sign in button" do
    visit '/'
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_selector(:link_or_button, 'Sign in')
  end

  scenario "has a sign up button" do
    visit '/'
    expect(page).to have_selector(:link_or_button, 'Sign up')
  end
end
