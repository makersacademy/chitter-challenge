def post_peep
  posting_peep('Charlottay', '@codey_mc_code_face', 'OMG! Makers weekend challenges r so cool?!!' )
end

def post_peeps(names)
  names.each do |name|
    posting_peep(name, '@codey_mc_code_face', 'OMG! Makers weekend challenges r so cool?!!')
  end
end

def posting_peep(name, username, peep)
  visit '/peeps/new'
  fill_in('Name', with: name)
  fill_in('Chitter Username', with: username)
  fill_in('Peep Message', with: peep)
  click_button('Add')
  expect(current_path).to eq '/peeps'
end
