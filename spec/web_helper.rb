def add_new_peep(content)
  visit '/peeps/index'
  fill_in('content', with: content)
  click_button('Peep')
end
