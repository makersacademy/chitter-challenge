class String
  def ends_in?(last_chars)
    l = last_chars.length
    end_of_url = self.chars.last(l).join
    last_chars == end_of_url
  end
end

def write_new_peep(msg)
  visit('/peeps/new')
  fill_in(:username, with: 'TestUser')
  fill_in(:peep, with: msg)
  click_button(id: 'submit_peep')
end

def create_account(name, username, email, password)
  visit('/users/new')
  fill_in(:name, with: name)
  fill_in(:username, with: username)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password)
  click_button(id: 'submit')
end

def complete_signup_with_wrong_passwords
  visit('/users/new')
  fill_in(:name, with: 'Tom Moir')
  fill_in(:username, with: 'tmerrr')
  fill_in(:email, with: 'tom@mail.me')
  fill_in(:password, with: 'MyPassword')
  fill_in(:password_confirmation, with: 'WrongPassword')
  click_button(id: 'submit')
end

def complete_signup_with_no_password
  visit('/users/new')
  fill_in(:name, with: 'Tom Moir')
  fill_in(:username, with: 'tmerrr')
  fill_in(:email, with: 'tom@mail.me')
  click_button(id: 'submit')
end
