
feature 'View Posts' do

  scenario 'messages can be posted' do
    sign_up
    fill_in :peep, with: 'Hey hows you'
    click_button 'Post'
    expect(page).to have_content 'Hey hows you'
  end

  # scenario 'all posts in chronological order with timestamp' do
  #   sign_up
  #   fill_in :peep, with: 'Hey hows you'
  #   click_button 'Post'
  #   fill_in :peep, with: 'Nope'
  #   click_button 'Post'
  #   fill_in :peep, with: 'Yes'
  #   click_button 'Post'
  #   expect(page).to have_content 'Yes Nope Hey hows you'
  # end

end