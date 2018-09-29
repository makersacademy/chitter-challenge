feature 'Post a peep' do
  scenario 'A user can post a peep' do
    visit('/')
    fill_in('post_peep', with 'Hot Diggity!')
    click_button('Peep!')
    expect(page).to have_content 'Hot Diggity!'
  end
end
