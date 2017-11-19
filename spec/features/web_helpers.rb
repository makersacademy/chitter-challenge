def fill_and_add_peep
  visit '/'
  fill_in :post, with: 'Hello World'
  fill_in :tags, with: 'greeting,message'
  click_button 'Post Peep'
end
