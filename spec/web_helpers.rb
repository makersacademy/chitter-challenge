def visit_root_and_sign_in
  visit '/'
  click_on 'Login or sign up'
  within '#returning-user-form' do
    fill_in 'username', with: 'mcquanzie'
    fill_in 'password', with: 'V3ryS3cur3P4ssw0rd'
    click_button 'login'
  end
end
