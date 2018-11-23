

feature 'posting a new peep to chitter' do
  scenario 'User writes a new peep and it can be viewed on the screen' do
    connection = PG.connect(dbname: 'chitter_test')
    visit '/'
    fill_in 'message', with: 'Hello'
    click_button 'Post'
    expect(page).to have_content 'Hello'
  end
end
