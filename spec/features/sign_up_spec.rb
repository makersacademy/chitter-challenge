require 'spec_helper'
require_relative 'web_helper'

feature 'sign up' do
  before do
      Capybara.reset_session!
    end
  scenario 'user can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page). to have_content "Welcome stf"
    expect(User.first.nickname).to eq('stf')
  end

  scenario 'user mismatched password confirmation' do
    expect {sign_up(password_confirmation: 'wrong')}.to_not change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
