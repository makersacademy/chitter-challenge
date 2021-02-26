feature 'Adding a peep to the feed' do
  scenario 'Peep displayed on the feed' do

    visit('/')
    click_button('add')

    fill_in('content', with: 'Peep!')
    click_button('submit')

    expect(page).to have_content 'Peep!'
  end
end
