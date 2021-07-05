feature 'Post peep' do
  scenario 'A user wants to post to Chitter' do
    visit('/')
    fill_in('text', with: 'My first peep')
    click_button('Post') 

    expect(page).to have_content 'My first peep'
  end
end