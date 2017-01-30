
def signup
  visit '/'
  fill_in(:name, with: 'Lauren')
  fill_in(:email, with: 'lauren@gmail.com')
  fill_in(:username, with: 'Lau')
  fill_in(:password, with: '1234')
  click_button('Signup')
end

def login
  visit '/login'
  fill_in(:email, with: 'lauren@gmail.com')
  fill_in(:password, with: '1234')
  click_button('Login')
end
