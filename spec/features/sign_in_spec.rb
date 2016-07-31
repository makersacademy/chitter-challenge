require 'spec_helper'

  feature 'sign_in' do

    let!(:user) do
      User.create(name: 'suse',
                  email: 'suse@gmail.com',
                  password: 'piano',
                  password_confirmation: 'piano')
    end

    scenario 'user can sign in' do
    sign_in
    expect(page).to have_content "Welcome, suse"
    end
  end
