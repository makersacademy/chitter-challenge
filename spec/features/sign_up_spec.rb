feature "sign up to chitter" do

  scenario "A user can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Hi, Bob! Welcome to Chitter!'
    expect(User.first.email).to eq 'bob@ross.com'
  end

  scenario 'Password matches' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario "Can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "Can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

end
