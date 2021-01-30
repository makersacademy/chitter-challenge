feature 'adding a new_peep' do
  scenario 'you can see your new_peep' do
    visit('/')
    fill_in('peep', with: 'Hello world')
    click_button('Tell The World')
    expect(page).to have_content 'Hello world'
  end
end
