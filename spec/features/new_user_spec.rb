feature 'creating a new user' do
  scenario 'creating a new user increases user count by 1' do
  expect { sign_up }.to change(User, :count).by(1)
  expect(page).to have_content('Welcome, Test Test')
  expect(User.first.email).to eq('test@test.com')
  end
end
