feature 'sign up to Chitter' do
  scenario 'with legitimate credentials' do
    expect { sign_up }.to change(User, :count).by(1)
  end
end
