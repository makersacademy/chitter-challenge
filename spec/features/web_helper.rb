def post_peep
  posting_peep('OMG! Makers weekend challenges r so cool?!!')
end

def post_peeps_usernames(usernames)
  usernames.each do |usernames|
    posting_peep('OMG! Makers weekend challenges r so cool?!!')
  end
end

def posting_peep(peep)
  visit '/peeps/new'
  fill_in('Peep Message', with: peep)
  click_button('Add')
  expect(current_path).to eq '/peeps'
end

def usernames(page)
  text_of_elements(page, ".peep_username")
end

def times(page)
  text_of_elements(page, ".peep_time")
end

def text_of_elements(page, css_class)
  page.all(:css, css_class).map { |node| node.text }
end

def sign_up(username, email: 'chazzas@hotmail.com', password_confirmation: '12345')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in(:name, with: 'Charlottay')
  fill_in(:username, with: username)
  fill_in(:email, with: email)
  fill_in(:password, with: '12345')
  fill_in(:password_confirmation, with: password_confirmation)
  click_button('Sign up')
end

def login(username)
  visit '/users/login'
  expect(page.status_code).to eq(200)
  fill_in(:username, with: username)
  click_button('Login')
end

def signup_and_peep
  sign_up
end
