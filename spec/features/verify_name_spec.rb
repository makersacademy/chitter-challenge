feature 'verifies that name is not empty' do
  scenario 'no name entered' do
    expect { sign_up(name: '') }.to change(User, :count).by(0)
  end
end
