require 'spec_helper'
require_relative 'helpers/session'


include SessionHelpers

feature 'User signs in' do

  before(:each) do
    User.create(email: 'sunshine@hope.com',
                username: 'sunnydays',
                name: 'Sally',
                password: 'hopeful',
                password_confirmation: 'hopeful')
  end

  scenario 'with correct details' do
    visit '/'
    expect(page).not_to have_content('Welcome, sunndays')
    sign_in('sunshine@hope.com', 'hopeful')
    expect(page).to have_content('Welcome, sunnydays')
  end

  scenario 'with incorrect details' do
    visit '/'
    expect(page).not_to have_content('Welcome, sunshine@hope.com')
    sign_in('sunshine@hope.com', 'wrong')
    expect(page).not_to have_content('Welcome, sunnydays')
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'sunshine@hope.com',
                username: 'sunnydays',
                name: 'Sally',
                password: 'hopeful',
                password_confirmation: 'hopeful')
  end

  scenario 'while being signed in' do
    sign_in('sunshine@hope.com', 'hopeful')
    click_button 'Time to leave?'
    expect(page).to have_content('Good-bye!') #
    expect(page).not_to have_content('Welcome, sunnydays')
  end
end


feature 'User signs up' do

  scenario 'when a new user visits the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Alib@b@')
    expect(User.first.username).to eq('Alib@b@')
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password: 'pass', password_confirmation: 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Sorry, your passwords do not match')
  end

  scenario 'with an email that is already registered' do
  expect { sign_up }.to change(User, :count).by(1)
  expect { sign_up }.to change(User, :count).by(0)
  expect(page).to have_content('This email is already taken')
end


end
