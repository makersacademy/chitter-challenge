feature 'Signing up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, david@example.com')
    expect(User.first.email).to eq('david@example.com')
  end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Your passwords don\'t match!'
  end

  scenario 'Requires an email address' do
    expect { sign_up(email: nil )}.not_to change(User, :count)
  end

  scenario "Requires a valid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end
end
