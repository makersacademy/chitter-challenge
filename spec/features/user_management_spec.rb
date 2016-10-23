feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, test@tester.com')
    expect(User.first.email).to eq('test@tester.com')
  end

  scenario "requires a matching comfirmation password" do
    expect { sign_up(password_confirmation: "not_the_same_as_first_password")}.not_to change(User, :count)
  end

  scenario "with a password that does not match" do
    expect {sign_up(password_confirmation: "not_the_same_as_first_password")}.not_to change(User, :count)
    expect(page).to have_content "Password and confirmation password do not match"
  end

end
