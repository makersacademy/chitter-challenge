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

  scenario 'User can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@test.co.uk')
    expect(User.first.email).to eq email
  end

  scenario 'Needs matching confirmation password' do
    expect { sign_up(password_confirm: 'wrong') }.not_to change(User, :count)
  end

  scenario 'When passwords dont match.' do
    expect { sign_up(password_confirm: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/sign_up')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'Cannot sign up without email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'User cannot sign up with not valid email' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end

  scenario 'Cannot sign up with existing email again' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is taken sucker')
  end
end
