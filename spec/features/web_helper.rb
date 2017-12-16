def send_peep(msg)
  fill_in :message, with: msg
  click_on 'PeepIt'
end

def signup(name: 'Joe Bloggs',
           username: 'JBloggy',
           password: 'blogg',
           email: 'joebloggs@hotmail.co.uk',
           password_conf: 'blogg'
          )
  visit '/signup'
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :email, with: email
  fill_in :password_confirmation, with: password_conf
  click_on 'Sign Up'
end

def signin
 visit '/'
 fill_in :username_or_email, with: 'joebloggs@hotmail.co.uk'
 fill_in :password, with: 'blogg'
 click_on 'Sign In'
end
