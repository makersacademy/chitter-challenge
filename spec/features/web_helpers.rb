def visit_and_add_peep(peep)
  visit('/')
  click_button('go incognito')
  expect(current_path).to eq('/chitter')
  click_button('New Peep')
  fill_in 'peep', with: peep
  click_button('Submit')
end
