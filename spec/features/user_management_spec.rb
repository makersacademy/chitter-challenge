require 'spec_helper'

feature 'sign up' do
  scenario 'user can access sign up from the homepage' do
    visit('/peeps')
    expect(page.status_code).to eq 200
    click_button 'Sign up'
    expect(page).to have_content('Join Chitter today')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong')}. not_to change(User, :count)
  end

  scenario 'passwords do not match' do
    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I can\'t sign up without a username' do
    expect { sign_up(username: nil)}.not_to change(User, :count)
  end

  scenario 'I can\'t sign up with an existing username' do
    sign_up
    expect { sign_up(username:'jo@jo.com')}.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'I can\'t sign up without an e-mail' do
    expect { sign_up(email:nil)}.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I can\'t sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email')}.not_to change(User, :count)
    expect(page). to have_content('Email has an invalid format')
  end

  scenario 'I can\'t sign up with an existing email address' do
    sign_up
    expect { sign_up(username:'jak', email:'jo@jo.com') }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
