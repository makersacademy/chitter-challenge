require 'spec_helper'

feature 'I want to sign up for Chitter' do
  scenario 'Allow user to create a Chitter account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page.current_path).to eq '/home'
    expect(page).to have_content("Welcome tansaku")
    expect(User.first.email).to eq("sam@makersacademy.com")
  end

  scenario 'If user password and password_confirmation do not match, no new Chitter account is created' do
    expect { sign_up(password_confirmation: 'secret') }.not_to change(User, :count)
    expect(page.current_path).to eq '/users/new'
    # expect(page).to have_content("Passwords to do not match")
  end


  def sign_up(username: "tansaku",
            name: "Samuel Russell Hampden Joseph",
            email: "sam@makersacademy.com",
            password: "s3cr3t",
            password_confirmation: "s3cr3t")
    visit "/users/new"
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Submit"
  end
end
