require 'spec_helper'

describe 'a user composes a peep' do

  scenario 'logged in user writes a peep and can see it' do
    sign_up(email: "batman@hotmail.com", password: "123", password_confirmation: "123")
    click_button "Post a Peep!"
    fill_in "Peep:", :with => ("Just a little Peep")
    click_button "Peep!"
    expect(page).to have_content "Hello"
  end

end
