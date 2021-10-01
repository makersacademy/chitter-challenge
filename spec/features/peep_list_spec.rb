feature 'Peep list' do
  before(:each) do
    visit('/users/new')
    fill_in 'user_name', with: 'First'
    fill_in 'email', with: 'test1@example.com'
    fill_in 'password', with: 'example'
    click_button('submit')
    visit('/peeps/new')
    fill_in 'content', with: 'Parsnips!!'
    click_button('submit')
    visit('/users/new')
    fill_in 'user_name', with: 'Second'
    fill_in 'email', with: 'test2@example.com'
    fill_in 'password', with: 'example'
    click_button('submit')
    visit('/peeps/new')
    fill_in 'content', with: 'Potatoes!!'
    click_button('submit')
  end
  scenario 'displays peeps in reverse chronological order' do
    peeps = page.all("div.peep")
    expect(peeps[0]).to have_content("Author: Second")
    expect(peeps[1]).to have_content("Author: First")
  end
end
