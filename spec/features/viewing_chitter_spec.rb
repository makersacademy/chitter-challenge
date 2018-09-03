feature 'viewing chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'CHITTER'
  end

  scenario 'can view a list of chits' do
    post_chits
    fill_in :peep, with: 'hey!'
    click_button 'post'
    fill_in :peep, with: 'bye!'
    click_button 'post'
    expect(page).to have_content 'hey!'
    expect(page).to have_content 'bye!'
  end

  scenario 'can view peeps in reverse' do
    post_chits
    str1 = 'This is a test peep'
    str2 = 'This is another test peep'
    fill_in :peep, with: str1
    click_button('post')
    fill_in :peep, with: str2
    click_button('post')
    click_link('view latest peeps')
    expect(page.body.index(str2)).to be > page.body.index(str1)
  end
end
