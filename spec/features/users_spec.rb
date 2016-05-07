require_relative '../spec_helper'
feature "user sign up" do
  scenario "when user sins up the count increases by 1" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, elia@gmail.com"
    expect(User.first.email).to eq "elia@gmail.com"

  end
  scenario "validation of the user password" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
  end
  scenario "can't sign up with no email" do
    expect { sign_up(email: nil)}.not_to change(User, :count)
    expect(current_path).to eq('/users')
   expect(page).to have_content('Email must not be blank')
  end
  scenario "trying to sign up with invalid email" do
    expect { sign_up(email: "non_email@gmail")}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end
  scenario 'I cannot sign up with an existing email' do
  sign_up
  expect { sign_up }.to_not change(User, :count)
  expect(page).to have_content('Email is already taken')
end
end
