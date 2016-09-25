require 'spec_helper'

  feature 'sign_out' do

    let!(:user) do
      User.create(name: 'suse',
                  email: 'suse@gmail.com',
                  password: 'piano',
                  password_confirmation: 'piano')
    end

    scenario 'user can sign out' do
    sign_in
    click_button('Sign out')
    expect(page).to have_content('Bye bye!')
    expect(page).not_to have_content('Welcome, suse')
    end
  end
