def add_peep(message)
  fill_in('message', with: message)
  click_button('Post!')
end

def current_path
  URI.parse(current_url).path
end

def register_details
  [{ field: 'name', field_input: 'John Thompson' },
  { field: 'user', field_input: 'jthompson' },
  { field: 'email', field_input: 'jt@gmail.com' },
  { field: 'password', field_input: 'password123' }]
end

def register_details_different
  [{ field: 'name', field_input: 'Andy' },
  { field: 'user', field_input: 'jthompson' },
  { field: 'email', field_input: 'jt@gmail.com' },
  { field: 'password', field_input: 'password456' }]
end

def register
  visit('/')
  find('#register-form').find('#register').click
  register_details.each do |details|
    fill_in(details[:field], with: details[:field_input])
  end
  find('#register').find('#submit').click
end

def register_same_user
  visit('/')
  find('#register-form').find('#register').click
  register_details_different.each do |details|
    fill_in(details[:field], with: details[:field_input])
  end
  find('#register').find('#submit').click
end

def login_details
  [{ field: 'user', field_input: "jthompson" },
  { field: 'password', field_input: 'password123' }]
end

def login_details_wrong
  [{ field: 'user', field_input: "jthompson" },
  { field: 'password', field_input: 'password456' }]
end

def login
  visit('/')
  find('#register-form').find('#login').click
  login_details.each do |details|
    fill_in(details[:field], with: details[:field_input])
  end
  find('#login').find('#submit').click
end

def login_wrong
  visit('/')
  find('#register-form').find('#login').click
  login_details_wrong.each do |details|
    fill_in(details[:field], with: details[:field_input])
  end
  find('#login').find('#submit').click
end

def logout
  click_button('Log out')
end
