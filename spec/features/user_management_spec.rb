require_relative 'web_helper'

feature 'Signing up' do
  scenario 'I can sign up for an account' do
    expect { sign_up }. to change(User, :count).by(1)
    expect(page).to have_content('Welcome, izzy@example.com')
    expect(User.first.email).to eq('izzy@example.com')
  end
end

feature 'Signing in' do
    let!(:user) do
      User.create(email: 'izzy@example.com',
                  password: 'password1')
    end
    scenario 'login with right info' do
      sign_in(email: user.email, password: user.password)
      expect(page).to have_content "Welcome, #{user.email}"
  end
end
