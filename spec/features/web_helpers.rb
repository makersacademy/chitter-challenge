def sign_in
  visit '/'
  click_button 'Sign in'
  expect(current_path).to eq '/peeps'
end

def open_new_peep_page
  sign_in

  click_button 'Post a peep'
  expect(current_path).to eq '/peeps/new'
end

def post_first_peep
  open_new_peep_page

  fill_in :peep, with: 'this is the first peep'
  click_button 'Peep!'
end

def post_second_peep
  open_new_peep_page

  fill_in :peep, with: 'this is the second peep'
  click_button 'Peep!'
end
