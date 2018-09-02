# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Posting Peeps' do 
  scenario 'user can post a peep to chitter' do
    visit '/'
    expect(page).to have_content 'Chitter'
    fill_in :peep, with: 'Hello world!'
    click_button 'Post'
    expect(page).to have_content 'Hello world!'
  end
end

feature 'Reverse chronology' do
  scenario 'peeps are shown in reverse chronological order' do
    visit '/'
    fill_in :peep, with: 'One'; click_button 'Post'
    fill_in :peep, with: 'Two'; click_button 'Post'
    fill_in :peep, with: 'Three'; click_button 'Post'
    expect(page).to have_content 'Three Two One'

  end
end