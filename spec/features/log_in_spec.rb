require 'spec_helper'
require 'web_helper'

feature "Sign in", type: :feature do
  scenario "I would like to be able to sign in" do
    visit('/log_in')
    expect(page.status_code).to eq 200

    sign_in
    expect(page).to have_content ("Please write you message") 
  end
end
