def add_peep(message)
  visit('/')
  click_button('Make Peep')
  fill_in('message', with: message)
  click_button('Post!')
end

def current_path
  URI.parse(current_url).path
end
