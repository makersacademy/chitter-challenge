feature 'creating peeps' do
  scenario 'so user can create a new peep' do
    sign_up
    sign_in(email: 'joe_bloggs@gmail.com', password: '12345')
    visit('/peeps/new')
    fill_in(:content, with: 'My first ever peep!')
    click_button('Post Peep')
    expect(page).to have_content('My first ever peep!')
  end
end
