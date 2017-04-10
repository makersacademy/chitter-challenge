feature 'signing out' do
  scenario 'signed in user can sign out' do
  sign_in
  click_button 'sign out'
  expect(current_path).to eq '/sessions/sign_in'
  end
end
