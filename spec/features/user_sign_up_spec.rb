feature 'User sign up form' do

  scenario 'User can sign up' do
    sign_up
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/welcome'
    expect(page).to have_content('Welcome, chun-li')
    expect(User.last.email).to eq 'chun-li@streetfighter.com'
  end

  scenario 'Requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  context 'when a password does not match' do
    scenario 'Returns a message to user' do
      expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
      expect(current_path).to eq '/create_user'
      expect(page).to have_content 'Passwords do not match'
    end
  end

end
