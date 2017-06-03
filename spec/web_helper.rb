def post_a_chit(text)
  visit '/chits/new'
  fill_in :message, with: text
  click_button 'Chit'
end
