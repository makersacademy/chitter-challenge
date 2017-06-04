def post_peep
  posting_peep('Charlottay', '@codey_mc_code_face', 'OMG! Makers weekend challenges r so cool?!!')
end

def post_peeps_names(names)
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

def names(page)
  text_of_elements(page, ".peep_name")
end

def times(page)
  text_of_elements(page, ".peep_time")
end

def text_of_elements(page, css_class)
  page.all(:css, css_class).map { |node| node.text }
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in(:name, with: 'Charlottay')
  fill_in(:email, with: 'chazzas@hotmail.com')
  fill_in(:password, with: '12345')
  click_button('Sign up')
end
