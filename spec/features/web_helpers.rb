def post_peep(message = "My first peep!")
  visit('/')
  fill_in 'peep', with: message
  click_button 'Peep'
end
