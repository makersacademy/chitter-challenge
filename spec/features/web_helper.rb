def post_new_peep
  visit('/posts/new')
   fill_in('new_peep', :with => 'Hello world!')
   click_button('PEEP')
end
