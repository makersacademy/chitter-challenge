def post_a_peep
  visit '/'
  click_button('Post')
  fill_in('text', with: 'I feel grrrrrreat')
  click_button('Peep')
end

def post_another_peep
  visit '/'
  click_button('Post')
  fill_in('text', with: 'I really do')
  click_button('Peep')
end
