require 'spec_helper'

feature 'Log in' do
  # TODO: extract to factory girl
  let!(:user) do
    User.create(username: 'User',
                email: 'user@nomail.com',
                name: 'Firstname Lastname',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  context 'when given correct credentials' do
    scenario 'authenticates the user' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    scenario 'authenticates the user' do
      log_in
      # expect(current_path).to eq '/peeps/all'
      # expect(current_user).not_to be_nil
      expect(page).to have_content "Welcome #{user.username}"
    end
  end

  context 'when given incorrect credentials' do
    scenario 'does not authenticate the user' do
      authenticated_user = User.authenticate(user.email, 'wrong_password')
      expect(authenticated_user).to be_nil
    end

    scenario 'displays an error message' do
      log_in
      expect(current_path).to eq '/sessions'
      # expect(current_user).to be_nil
      expect(page).not_to have_content "Welcome #{user.username}"
    end
  end
end
