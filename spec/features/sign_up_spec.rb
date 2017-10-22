feature 'Sign up' do
  scenario 'I want users to be able to sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'I want to be denied an account without an email address' do
    expect { sign_up(email: '') }.not_to change(User, :count)
  end

  scenario 'I do not want an email address to be used twice' do
    2.times { sign_up(email: "example@example.com") }
    expect(page).to have_content 'We already have that email'
  end

  context 'Signed up first: ' do
    before { sign_up }
    scenario 'I want users to be welcomed on signing up' do
      expect(page).to have_content('Welcome, alice@example.com')
    end

    scenario 'I want users\' email addresses to be added to the database' do
      expect(User.first.email).to eq('alice@example.com')
    end
  end
end
