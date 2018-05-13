# require './spec/features/login_helper'

def user_logs_in
  visit '/login'
  fill_in('log_username', with: 'Peeping Sally')
  fill_in('log_password', with: 'helikespeeping')
  click_button('Login')
end
