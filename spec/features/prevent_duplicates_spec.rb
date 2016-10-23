require 'spec_helper'

RSpec.feature 'prevent duplications' do
  scenario 'Cannot create account with email that already exists in database' do
    sign_up
    expect{sign_up}.to change(User, :count).by(0)
    expect(page).to have_content('Email address is already registered')
  end
end
