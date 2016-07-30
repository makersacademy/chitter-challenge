
def register
  visit 'users/new'
  expect(page.status_code).to eq 200

  fill_in :email, with: 'jck_catchall@outlook.com'
  fill_in :password, with: 'abc'
  fill_in :password_confirmation, with: 'abc'
  click_button 'REGISTER'
end
