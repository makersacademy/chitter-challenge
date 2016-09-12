require 'spec_helper'

  feature 'sign_in' do

    let!(:user) do
      User.create(name: 'Erce Kal',
                  username: 'erce',
                  email: 'erce@erce.com',
                  password: '123456',
                  password_confirmation: '123456')
    end

    scenario 'user can sign in' do
    sign_in
    expect(page).to have_content "Welcome, Erce Kal"
    end
  end
