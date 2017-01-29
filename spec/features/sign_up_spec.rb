require 'spec_helper'

feature 'sign up form' do

  scenario "can return to homepage" do
    visit('/users/new')
    click_button('Back')
    expect(page).to have_current_path('/')
  end

  context 'password verification' do
    context 'password matches' do
      scenario 'can sign up' do
        sign_up('name', 'user', 'test@test.com', 'password', 'password')
        expect(current_path).to eq('/peeps')
        expect(page).to have_content("Welcome, test@test.com")
      end

      scenario 'signing up increases user count' do
        expect{sign_up('name', 'user', 'test@test.com', 'password', 'password')}.to change{User.count}.by(1)
      end

      scenario "is empty" do
        expect{sign_up('name', 'user', 'test@test.com', nil, 'password')}.to change{User.count}.by(0)
      end
    end

    context "mismatched password" do
      scenario "doesn't add a user" do
        expect{sign_up('name', 'user', 'test@test.com', 'password', 'password_conf')}.to change{User.count}.by(0)
      end

      scenario "is empty" do
        expect{sign_up('name', 'user', 'test@test.com', 'password', nil)}.to change{User.count}.by(0)
      end

      scenario "leaves user on /users page" do
        sign_up('name', 'user', 'test@test.com', 'password', 'password_conf')
        expect(current_path).to eq('/users/new')
      end

      scenario "throws an error message" do
        sign_up('name', 'user', 'test@test.com', 'password', 'password_conf')
        expect(page).to have_content("Password does not match the confirmation")
      end

      scenario "shows original email address in sign up form" do
        sign_up('name', 'user', 'test@test.com', 'password', 'password_conf')
        expect(find_field('email').value).to eq('test@test.com')
      end

      scenario "shows original name in sign up form" do
        sign_up('name', 'user', 'test@test.com', 'password', 'password_conf')
        expect(find_field('name').value).to eq('name')
      end

      scenario "shows original username in sign up form" do
        sign_up('name', 'user', 'test@test.com', 'password', 'password_conf')
        expect(find_field('username').value).to eq('user')
      end
    end
  end

  context "email address" do
    scenario "is empty" do
      expect{sign_up('name', 'user', nil, 'password', 'password')}.to change{User.count}.by(0)
    end
    scenario "not to have invalid format" do
      expect{sign_up('name', 'user', 'testtest.com', 'password', 'password')}.to change{User.count}.by(0)
    end
  end

  context "unique email" do
    scenario "should be unique" do
      User.create(name: 'name', username: 'user', email: 'test@test.com', password: 'password', password_conf: 'password')
      expect{sign_up('name', 'user', 'test@test.com', 'password', 'password')}.to change{User.count}.by(0)
    end
    scenario "non unique email throws error" do
      User.create(name: 'name', username: 'user', email: 'test@test.com', password: 'password', password_conf: 'password')
      sign_up('name', 'user', 'test@test.com', 'password', 'password')
      expect(page).to have_content("Email is already taken")
    end
  end

  context "name" do
    scenario "is empty" do
      expect{sign_up(nil, 'user', 'test@test.com', 'password', 'password')}.to change{User.count}.by(0)
    end
    scenario "not to have invalid format" do
      expect{sign_up('{)(£)}', 'user', 'testtest.com', 'password', 'password')}.to change{User.count}.by(0)
    end
  end

  context "username" do
    scenario "is empty" do
      expect{sign_up('name', nil, 'test@test.com', 'password', 'password')}.to change{User.count}.by(0)
    end
    scenario "should be unique" do
      User.create(name: 'name', username: 'user', email: 'test@test.com', password: 'password', password_conf: 'password')
      expect{sign_up('name', 'user', 'test@test.com', 'password', 'password')}.to change{User.count}.by(0)
    end
    scenario "non unique email throws error" do
      User.create(name: 'name', username: 'user', email: 'test@test.com', password: 'password', password_conf: 'password')
      sign_up('name', 'user', 'test@test.com', 'password', 'password')
      expect(page).to have_content("Email is already taken")
    end
  end
end
