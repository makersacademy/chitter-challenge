require 'spec_helper'

feature "First Page" do
  include Helpers
  scenario "I want to be allowed to sign up" do
    visit '/'
    within(:css, "div#first-page") do
      click_link "Sign Up"
    end
    expect(page.current_path).to eq '/sign_up'
  end

  scenario "I want to be allowed to login" do
    visit '/'
    # within (:css, "div#first-page") do
      click_link "Login"
    expect(page.current_path).to eq '/log_in/new'
  end
end
