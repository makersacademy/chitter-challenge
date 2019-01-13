feature 'User peeps' do

  scenario 'can be written' do
    sign_up
    fill_in :content, with: 'My first peep!'
    click_button 'Post'
  end

  scenario 'can be posted' do
    sign_up
    fill_in :content, with: 'My first peep!'
    click_button 'Post'
    expect(page).to have_content 'My first peep!'
  end

end


# feature 'All peeps' do

#   scenario 'are displayed in reverse chronological order' do
  
#   end

#   scenario 'show time created' do
  
#   end

# end