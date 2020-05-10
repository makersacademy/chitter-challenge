def log_in
  User.new(name: 'Dec', user_name: 'dk', email: 'dec@dec.com', password: 'pa55word').save
  visit('/log-in')
  fill_in('username', with: 'dk')
  fill_in('password', with: 'pa55word')
  click_button('log in')
end
