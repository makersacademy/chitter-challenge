require 'spec_helper'

  feature 'sign_out' do

    let!(:user) do
      User.create(name: 'Erce Kal',
                  username: 'erce',
                  email: 'erce@erce.com',
                  password: '123456',
                  password_confirmation: '123456')
    end

    scenario 'user can sign out' do
    sign_in
    click_button("Sign out")
    expect(page).to have_content('Bye bye!')
    expect(page).not_to have_content('Welcome, Erce Kal')
    end
  end
