feature 'Sign up' do
  scenario 'I can sign up as a user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome @King!')
    expect(User.first.email).to eq 'elvis@gmail.com'
  end

  scenario 'Requires a matching confirmation password' do
    expect do
      sign_up(password_confirmation: 'wrong')
    end
      .not_to change(User, :count)
  end

  scenario 'The user fails confirming password' do
    sign_up(password_confirmation: 'wrong')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I can\'t sign up without an email' do
    expect { sign_up(email: nil) }.to_not change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I can\'t sign up with an invalid email' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cant\'t sign up if the email is taken' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
