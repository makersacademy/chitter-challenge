feature 'Signup Form' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome cat')
    expect(User.first.email).to eq('cat@cat.com')
  end

  scenario 'Requires matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.to change(User, :count).by 0
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "I can't sign up with an existing email" do
    sign_up
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario "I can't sign up without a username" do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Username must not be blank'
  end

  scenario "I can't sign up with an existing username" do
    sign_up(email: "saucy@cat.com")
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario "I can't sign up without a name" do
    expect { sign_up(name: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Name must not be blank'
  end
end
