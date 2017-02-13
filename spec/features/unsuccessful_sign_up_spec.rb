require 'spec_helper'

RSpec.feature 'unsuccessful account sign up', :type => :feature do

  include Helpers

  scenario 'user cannot sign up without entering a firstname' do
    expect { sign_up(firstname: nil) }.not_to change(User, :count)
    expect(page).to have_content('Firstname must not be blank')
  end

  scenario 'user cannot sign up without entering a surname' do
    expect { sign_up(surname: nil) }.not_to change(User, :count)
    expect(page).to have_content('Surname must not be blank')
  end

  scenario 'user cannot sign up without entering an email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'user cannot sign up without entering a username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'user cannot sign up without entering a password' do
    expect { sign_up(password: nil) }.not_to change(User, :count)
    expect(page).to have_content('Password must not be blank')
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect { sign_up(email: 'not-an-email') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign up with an already registered email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end