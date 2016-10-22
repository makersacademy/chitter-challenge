require 'spec_helper'

RSpec.feature 'password confirmation' do
  scenario 'mismatching password error' do
    visit '/users/new'
    expect(page.status_code).to eq 200
    fill_in :user_name, with: 'Tester'
    fill_in :email, with: 'test@tester.com'
    fill_in :password, with: 'testpass'
    fill_in :password_confirmation, with: 'testpassed'

    expect {click_button 'Create account'}.to change(User, :count).by(0)
  end
end
