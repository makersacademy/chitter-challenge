feature 'Post a peep' do
  scenario 'A user can post a peep' do
    visit('/')
    click_button('Sign in')
    visit('/write_peep')
    fill_in('message', with: "Hot Diggity!")
    click_button('Peep!')
    visit('/view_peeps')
    expect(page).to have_content 'Hot Diggity!'
  end
end
