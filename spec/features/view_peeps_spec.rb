feature 'View peeps' do
  scenario 'User can see peeps' do
    visit '/'
    expect(page).to have_content "What a beautiful morning!"
    expect(page).to have_content "Back on terra firma."
    expect(page).to have_content "Free as a bird."
  end
end

feature 'Post peeps' do
  scenario 'User can add peeps' do
    visit '/'
    fill_in :peep, with: 'A short message'
    click_button 'Post'
  
    expect(page).to have_content "A short message"
  end
end
