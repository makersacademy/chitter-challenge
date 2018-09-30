def add_peep(message)
  visit('/')
  fill_in('message', with: message)
  click_button('Post!')
end

def current_path
  URI.parse(current_url).path
end

def register_details
  [{ field: 'name', field_input: 'John Thompson' },
  { field: 'username', field_input: 'jthompson' },
  { field: 'email', field_input: 'jt@gmail.com' },
  { field: 'password', field_input: 'password123' }]
end

def register
  visit('/')
  find('#register-form').find('#register').click
  register_details.each do |details|
    fill_in(details[:field], with: details[:field_input])
  end
  find('#register').find('#submit').click
end
