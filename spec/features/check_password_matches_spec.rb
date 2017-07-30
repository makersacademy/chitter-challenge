feature 'verifies password' do
  scenario 'no password entered' do
    expect { sign_up(password: '', password_confirmation: '') }.to change(User, :count).by(0)
  end
  scenario 'passwords do not match' do
    expect { sign_up(password: '1234', password_confirmation: '1235') }.to change(User, :count).by(0)
  end
end
