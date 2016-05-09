feature 'Account confirmation page' do
  scenario 'it should have a reditect link' do
  create_an_account
  expect(current_path).to eq('/confirm_account')
  click_button('view your chittr feed')
  expect(current_path).to eq('/feed')
  end
end
