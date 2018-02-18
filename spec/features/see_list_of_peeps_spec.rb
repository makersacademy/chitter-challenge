feature 'Viewing peeps' do
  scenario 'A user can see a list of peeps' do
    visit('/')

    expect(page).to have_content "This is a test peep"
    expect(page).to have_content "This is another test peep"
  end
end

feature 'Post a peep' do
  scenario 'A user can post a peep to chitter' do
    visit('/post')
    fill_in('post', with: 'My first peep')
    click_button('Submit')
    expect(page).to have_content 'My first peep'
  end
end
