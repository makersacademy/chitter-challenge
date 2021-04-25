def visit_and_add_peep(peep)
  visit('/')
  expect(current_path).to eq('/chitter')
  click_button('New Peep')
  fill_in 'peep', with: peep
  click_button('Submit')
end
