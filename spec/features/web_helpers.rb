def add_peep(peep)
  visit('/')
  click_link(text: 'New Peep', href: '/new_peep')
  fill_in(name: 'peep_text', with: peep)
  click_button(id: 'submit', value: 'Add Peep')
end
