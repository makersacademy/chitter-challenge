feature 'User can post a message' do 
  scenario 'Posting a message' do 
    visit('/')
    fill_in('text', with: "Good morning!")
    fill_in('name', with: "John")
    click_button('Submit')
    expect(page).to have_content('Peep: Good morning!', 'Name: John')
  end
end


