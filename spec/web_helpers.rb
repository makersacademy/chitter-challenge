def post_first_blab
  visit '/'
  fill_in 'content', with: 'my first blab!'
  click_button 'blab'
end
