require 'spec_helper'

let(:email) { 'test@test.co.uk' }
let(:password) { 'password1234' }

feature 'Sign up' do
  scenario 'User can sign up to the page' do
    visit '/log_in'
    fill_in :email, with: email
    fill_in
  end
end
