feature 'Signing up' do
  scenario 'users can sign up' do
    expect{ sign_up }.to change(User, :count).by 1
  end

end