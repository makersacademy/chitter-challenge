def post_a_message
  visit '/'
  fill_in('message', with: 'first test')
  click_on 'Submit'

end

def sign_up
  visit '/'
  click_on 'Sign Up'
  fill_in('Name', with: 'Magnus')
  fill_in('Username', with: 'The Crimson King')
  fill_in('Email', with: 'Magnus@1000sons.co.pr')
  fill_in('Password', with: 'ilovemagic')
  click_on 'Sign Up'
end

def sign_up_twice
  visit '/'
  click_on 'Sign Up'
  fill_in('Name', with: 'Horus')
  fill_in('Username', with: 'The Luna Wolf')
  fill_in('Email', with: 'Horus@SOH.co.ct')
  fill_in('Password', with: 'iloveheresy')
  click_on 'Sign Up'
  click_on 'Log Out'
  click_on 'Sign Up'
  fill_in('Name', with: 'Horus2')
  fill_in('Username', with: 'The Luna Wolf2')
  fill_in('Email', with: 'Horus@SOH.co.ct')
  fill_in('Password', with: 'iloveheresy2')
  click_on 'Sign Up'
end

def post_two_messages
  visit '/'
  fill_in('message', with: 'second test')
  click_on 'Submit'
  fill_in('message', with: 'third test')
  click_on 'Submit'
end

def login
  visit '/'
  click_on 'Log In'
  fill_in('Username', with: 'The Crimson King')
  fill_in('Password', with: 'ilovemagic')
  click_on 'Log In'
end

def login_with_wrong_details
  visit '/'
  click_on 'Log In'
  fill_in('Username', with: 'The Crimson King')
  fill_in('Password', with: 'idontlovemagic')
  click_on 'Log In'
end
