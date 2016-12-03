require 'spec_helper'
require_relative 'web_helpers'
require './app/models/user'

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
    sign_up
  end

  scenario 'User can sign up only when passwords are matching' do
    expect { sign_up(password_confirm: 'wrong') }.not_to change(User, :count)
  end
end
