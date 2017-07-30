feature 'FEATURE: registering new users' do
  include Helpers

  scenario 'signing up as a new user' do
    expect { sign_up }.to change{ User.count }.by(1)
    expect(page).to have_content "Welcome to Chitter, user123!"
  end

  scenario 'providing mismatching password and password confirmation values' do
    expect { sign_up(password_confirmation: "wrong") }.to_not change{ User.count }
    expect(page).to have_content "Password and password confirmation don't match!"
  end

  scenario 'using a preregistered username' do
    sign_up
    expect { sign_up }.to_not change{ User.count }
    expect(page).to have_content "Username already taken!"
  end

  scenario 'using a preregistered email' do
    sign_up
    expect { sign_up }.to_not change{ User.count }
    expect(page).to have_content "Email address is already registered!"
  end
end
