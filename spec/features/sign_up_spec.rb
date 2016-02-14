require 'spec_helper'

feature 'Sign up' do
  context 'when given correct credentials' do
    scenario 'creates new user' do
      expect { sign_up }.to change(User, :count).by 1
      expect(User.first.email).to eq 'user@nomail.com'
      expect(page).to have_content 'Welcome User'
    end
  end

  context 'when not given a username' do
    scenario 'displays an error notice' do
      expect { sign_up(username: nil) }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      within('ul#errors') do
        expect(page).to have_content 'Username must not be blank'
      end
    end
  end

  context 'when given an invalid email' do
    scenario 'displays an error notice' do
      expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      within('ul#errors') do
        expect(page).to have_content 'Email has an invalid format'
      end
    end
  end

  context 'when not given an email' do
    scenario 'displays an error notice' do
      expect { sign_up(email: nil) }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      within('ul#errors') do
        expect(page).to have_content 'Email must not be blank'
      end
    end
  end

  context 'when not given a name' do
    scenario 'displays an error notice' do
      expect { sign_up(name: nil) }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      within('ul#errors') do
        expect(page).to have_content 'Name must not be blank'
      end
    end
  end

  # FIXME
  # context 'when not given a password' do
  #   scenario 'displays an error message' do
  #     expect { sign_up(password: nil) }.not_to change(User, :count)
  #     expect(current_path).to eq '/users'
  #     expect(page).to have_content 'Password and confirmation do not match'
  #   end
  # end

  context 'when passwords don\'t match' do
    scenario 'displays an error message' do
      expect { sign_up(pwd_conf: 'wrong') }.not_to change(User, :count)
      expect(current_path).to eq '/users'
      within('ul#errors') do
        expect(page).to have_content 'Password does not match the confirmation'
      end
    end
  end
end
