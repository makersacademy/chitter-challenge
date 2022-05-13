def sign_up
  visit('/signup')
  fill_in :user_name, with: "amfibiya17"
  fill_in :password, with: "12345678"
  fill_in :email, with: 'test@email.com'
  click_button 'Create Account'
end

def log_in
  visit('/login')
  fill_in :user_name, with: "amfibiya17"
  fill_in :password, with: "12345678"
  click_button 'Please login'
end

def add_peep
  Timecop.freeze(Time.parse("2022-05-13 16:40:52")) do
    visit('/peep')
    fill_in('peep_text', with: 'Every application somehow needs PosgreSQL')
    click_button 'Submit'
    visit('/peep')
  end
end
