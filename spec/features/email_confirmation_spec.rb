require 'spec_helper'

RSpec.feature 'email confirmation' do
  scenario 'tried to sign up without entering an email' do
    expect{ sign_up(:email => nil) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is mandatory')
  end

  scenario 'tried to sign up with an incorrect email format' do
    expect{ sign_up(:email => 'j.smith@example') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Doesn\'t look like an email address')
  end

  scenario 'tried to sign up with a existing email address' do
    sign_up
    expect(User.count).to eq(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("We already have that email")
  end
end
