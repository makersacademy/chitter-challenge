def log_in
  visit '/'
  fill_in('new-un', with: 'My username')
  fill_in('email', with: 'example@domain.com')
  fill_in('name', with: 'John Doe')
  fill_in('new-ps', with: 'pa33w0rd')
  click_button "Sign up"
end
