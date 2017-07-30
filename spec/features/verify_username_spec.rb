feature 'username must be unique and not empty' do
  scenario 'empty username' do
    expect { sign_up(username: '') }.to change(User, :count).by(0)
  end
  scenario 'existing username' do
    expect { 2.times { sign_up } }.to change(User, :count).by(1)
  end
end
