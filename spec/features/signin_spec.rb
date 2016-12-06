require 'spec_helper'

def sign_in
  visit '/signin'
  fill_in :email, with:'vero@test.com'
  fill_in :password, with:'password'
  click_button 'Sign in'
end

feature 'User sign in' do
  scenario 'user can sign in' do
    sign_up
    sign_in
    expect(page.status_code).to eq 200
    expect(current_path).to include '/peeps'
  end

end
