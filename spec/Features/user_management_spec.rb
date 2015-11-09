require "spec_helper"

feature 'User sign up' do
	scenario 'requires a matching confirmation password' do

	expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
end

  def sign_up(email: 'eleni_s_2015@hotmail.com',
              password: 'Passw0rd',
              password_confirmation: 'Passw0rd')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
