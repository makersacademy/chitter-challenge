feature 'signing up' do
scenario ' should be able to sing up from the home page' do
  visit('/')
  expect(page).to have_button('sign up')
  click_button('sign up')
  expect(page).to have_field('username')
  fill_in('username', :with => 'eddoddo')
  expect(page).to have_field('password')
  fill_in('password', :with => 'Secure_PW')
  expect(page).to have_field('email address')
  fill_in('email address', :with => 'edd0ddi0@gmail.com')
  expect(page).to have_button('submit')
  click_button('submit')
  end
end