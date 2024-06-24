feature 'post a peep and see it' do
  scenario 'write a peep and see it displayed on page' do
    visit '/'
    fill_in('peep', with: 'My first peep!')
    click_button('Peep')
    expect(page).to have_content('My first peep!')
  end
end
