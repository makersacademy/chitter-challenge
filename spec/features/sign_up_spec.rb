require 'spec_helper'

feature 'sign up for Chitter' do
  scenario 'via email' do
    visit('/chitter/sign-up')
    fill_in "name", with: "Irina"
    fill_in "username", with: "Miaow"
    fill_in "email", with: "imiaow@test.com"
    fill_in "password", with: "test123"
    click_button "Create account"
    new_user = User.find(1)
    expect(new_user.name).to eql("Irina")
    expect(new_user.username).to eql("Miaow")
    expect(new_user.email).to eql("imiaow@test.com")
    expect(new_user.password).to eql("test123")
  end
end
