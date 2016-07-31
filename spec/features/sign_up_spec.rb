require_relative 'web_helpers'

# User Story 1:
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do
  scenario 'I can sign up to Chitter' do
    expect { sign_up }.to change(User, :count).by 1
    expect(page.current_path).to eq '/peeps'
    expect(page).to have_content "Welcome back to Chitter, Jonny"
    expect(User.first.email).to eq "jonny@email.com"
  end

  scenario 'Password is encrypted into password digest' do
    sign_up
    expect(User.first.password_digest).to_not eq "somepassword"
  end

  scenario 'Is not completed with passwords that do not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page.current_path).to eq '/signup'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "I can't sign up with a duplicate email" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

end
