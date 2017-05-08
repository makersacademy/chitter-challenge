feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hello! example123')
    expect(User.first.email).to eq('example@email.com')
  end

  scenario 'I cannot sign up if passwords do not match' do
    expect { incorrect_sign_up }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I cannot sign up without an email address" do
    expect { email_field_nil }.not_to change(User, :count)
  end

  scenario 'I must sign up with a unique email address' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end
