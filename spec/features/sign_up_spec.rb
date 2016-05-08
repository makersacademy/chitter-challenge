require 'web_helper'

feature 'Users can sign up' do
  scenario 'I can sign up as a new User' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Thanks for signing up')
    expect(User.first.email).to eq('user@email.com')
    expect(User.first.username).to eq('number1')
    expect(User.first.name).to eq('First User')
  end

  scenario 'require a matching confirmation password' do
    expect { sign_up_incorrectly(password_confirmation: 'wrong') }.not_to change(User, :count)

  end

  scenario 'data saved if password confirmation is incorrect' do
    sign_up_incorrectly
    expect(find_field('email').value).to eq('user@email.com')
    expect(find_field('username').value).to eq('number1')
    expect(find_field('name').value).to eq('First User')
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without a name' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without a username' do
    expect { sign_up(name: nil) }.not_to change(User, :count)
  end

  xscenario 'I cannot sign up without a password' do
    expect {sign_up(password: nil, password_confirmation: nil) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end






end
