feature 'Register a new user' do
  scenario 'User signs up with name, username and password' do
    sign_up

    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.full_name).to eq 'Samuel Russell Hampden Joseph'
    expect(User.first.user_name).to eq 'tansaku'
    expect(User.first.email).to eq 'sam@makersacademy'

    expect(current_path).to eq '/'
    expect(page).to have_content '@tansaku'
  end
end
