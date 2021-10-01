feature 'Peep list' do
  before(:each) do
    visit('/peeps/new')
    fill_in 'user_name', with: 'Twitter'
    fill_in 'content', with: 'Lawsuit!!'
    click_button('submit')
    visit('/peeps/new')
    fill_in 'user_name', with: 'Second'
    fill_in 'content', with: 'Potatoes!!'
    click_button('submit')
  end
  scenario 'displays peeps in reverse chronological order' do
    peeps = page.all("div.peep")
    expect(peeps[0]).to have_content("Author: Second")
    expect(peeps[1]).to have_content("Author: Twitter")
  end
end
