require 'spec_helper'

feature "User sign in" do

  scenario "with correct credentials" do
    sign_up
    sign_in
    expect(page).to have_content("Welcome, William")
  end

end
