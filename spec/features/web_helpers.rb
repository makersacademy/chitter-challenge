def sign_in
  visit '/'
  click_button 'Sign in'
  expect(current_path).to eq '/peeps'
end
