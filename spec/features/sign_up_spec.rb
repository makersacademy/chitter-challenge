feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up("alice@example.com", "oranges!", "oranges!") }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up("alice@example.com", "123", "321") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'Requires a non-empty email address' do
    expect { sign_up("", "123","123") }.not_to change(User, :count)
  end

  scenario "user can't sign up with invalid format email" do
    expect { sign_up("pep@gmail", "123", "123") }.not_to change(User, :count)
  end

  scenario "user can't sign up if email already registered" do
    sign_up("pepe@uno.com","123","123")
    expect { sign_up("pepe@uno.com", "456", "456") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email is already taken"
  end
end