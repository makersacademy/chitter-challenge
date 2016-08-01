require 'helpers/sign_up_helper'

feature 'user sign up management' do

scenario 'requires a matching confirmation password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq '/user'
    expect(page).to have_content 'Password does not match the confirmation'
end

scenario 'a user cannot sign up with the same email twice' do
  sign_up
  expect{sign_up}.not_to change(User, :count)
  expect(page).to have_content 'Email is already taken'
end

scenario 'a user cannot sign up with the same user name twice' do
  sign_up
  expect{sign_up}.not_to change(User, :count)
  expect(page).to have_content 'User name is already taken'
end


  scenario 'a user cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'a user cannot sign up without a full name' do
    expect { sign_up(full_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content('Full name must not be blank')
  end

  scenario 'a user cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/user')
    expect(page).to have_content('Email has an invalid format')
  end

end
