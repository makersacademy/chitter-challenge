
def visit_and_peep(custom_message)
  visit '/'
  click_link('Compose Peep')
  fill_in :message, with: custom_message
  click_button 'Peep'
end
