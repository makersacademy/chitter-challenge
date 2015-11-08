feature 'checking user accounts'
scenario 'cannot sign up with the same username/email twice' do
  sign_up
  expect { sign_up }.to_not change{ User.count }
  expect(page).to have_content('A unique username must be used')
end
