feature 'User sign up' do
  scenario 'signing up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello, Gweaton')
    expect(User.first.email).to eq('george@example.com')
  end
  scenario 'requires a matching password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password does not match the confirmation'
  end
  scenario "can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end
  scenario "can't sign up without a valid email" do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
  end
  scenario "can't sign up with an existing email" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
