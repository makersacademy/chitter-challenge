def submit_message
  visit '/'
  fill_in(name: 'message', with: 'Today I had air for lunch. The flavour was exquisite.')
  click_button('Submit')
end
