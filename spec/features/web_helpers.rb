def post_peep
  visit '/'
  click_link 'Write a Peep'
  fill_in 'text', :with => 'My first peep'
  click_button 'Share Peep'
end