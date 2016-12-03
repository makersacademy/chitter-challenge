require 'spec_helper'

feature 'Sign up' do

  let(:email) { 'test@test.co.uk' }
  let(:password) { 'password1234' }
  let(:password_confirm) { 'password1234' }
  let(:name) { 'unicornelia' }
  let(:handle) { 'Kdawg' }

  scenario 'User can click on sign up link on homepage' do
    visit '/'
    find(:xpath, "//a[@href='/sign_up']").click
  end

  scenario 'User can fill out sign up form' do
    visit '/sign_up'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirm, with: password_confirm
    fill_in :name, with: name
    fill_in :handle, with: handle
    click_button 'Sign Up'
  end
end
