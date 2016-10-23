
feature 'User sign up' do
	scenario 'when user signs up, the User count increases by 1' do
    expect { sign_up }.to change(User, :count).by(1)
	end

  scenario 'Page displays hello message to user' do
    sign_up
    expect(page).to have_content('Welcome, dog@example.com')
  end

  scenario 'The user and the email given match' do
    sign_up
    expect(User.first.email).to eq('dog@example.com')
  end

  scenario 'password and password_confirmation should match' do
    expect { sign_up(password_confirmation: 'apples!') }.not_to change(User, :count)
  end

  scenario 'if password and password_confirmation do not match a message should be shown' do
    sign_up(password_confirmation: 'apples!')
    expect(current_path).to eq('/users')
    # expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario 'user cannot login if email not provided' do
    expect { sign_up(password_confirmation: nil) }.not_to change(User, :count)
  end

  scenario "user can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario "user can't sign up twice with the same address" do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    # expect(page).to have_content("Email Already in use")
  end

end
