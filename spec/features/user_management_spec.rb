# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Client sign up' do
  scenario 'I can sign up as a new user with valid password' do
    expect { sign_up }.to change { User.count }.by(1)
    expect(User.first.email).to eq('test@email.com')
  end

  scenario "I can't sign up with wrong password confirmation" do
    visit('/users/new')
    expect(page.status_code).to eq(200)

    expect { sign_up(password_confirmation: 'wrong') }.not_to change { User.count }
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up without name" do
    expect { sign_up(name: nil) }.not_to change { User.count}
  end

  scenario "I can't sign up without username" do
    expect { sign_up(username: nil) }.not_to change { User.count}
  end
end
