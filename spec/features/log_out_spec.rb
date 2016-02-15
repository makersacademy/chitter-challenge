require 'spec_helper'

feature 'Log out' do
  # TODO: extract to factory girl
  let!(:user) do
    User.create(username: 'User',
                email: 'user@nomail.com',
                name: 'Firstname Lastname',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  context 'when user is logged in' do
    before do
      log_in
    end

    scenario 'logs the user out' do
      log_out

      expect(current_path).to eq '/peeps/all'
      expect(page).to have_content 'Welcome to Chitter'
      expect(page).not_to have_content 'Welcome User'
    end
  end
end
