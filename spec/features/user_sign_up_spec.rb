feature 'User sign up' do

  scenario 'Signs up a user' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Welcome, chun-li')
    expect(User.last.email).to eq 'chun-li@streetfighter.com'
  end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/create_user')
    expect(page).to have_content('Email must not be blank')
end

  context 'when a password does not match' do
    scenario 'Returns a message to user' do
      expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
      expect(current_path).to eq '/create_user'
      expect(page).to have_content 'Password does not match the confirmation'
    end
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/create_user')
    expect(page).to have_content('Email has an invalid format')
  end

  context 'when a user has signed up with an email address' do
    scenario 'Cannot sign up with that same email address' do
      sign_up
      expect { sign_up }.to_not change(User, :count)
      expect(page).to have_content 'Email is already taken'
    end
  end

end
