feature 'Post a message' do
  scenario 'User can post a message to Chitter' do
    visit '/peeps/new'    
    fill_in(:content, with: 'I love green eggs & ham')
    click_button "Post Peep"
    
    expect(page).to have_content('I love green eggs & ham')
  end
end
