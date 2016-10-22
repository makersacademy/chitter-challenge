require 'spec_helper'

feature 'I want to log out of Chitter' do

  let!(:user) do
    User.create(username: "tansaku",
              name: "Samuel Russell Hampden Joseph",
              email: "sam@makersacademy.com",
              password: "s3cr3t",
              password_confirmation: "s3cr3t")
  end

  scenario 'while being signed in' do
    sign_in(username: 'tansaku', password: 's3cr3t')
    # expect(current_path).to eq '/home'
    click_button 'Sign Out'
    expect(page).to have_content('Bye!')
    expect(page).not_to have_content('Hello tansaku')
  end

end
