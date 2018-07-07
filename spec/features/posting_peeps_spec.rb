feature 'Posting a new peep' do

  scenario ' A user can post a new ' do
    visit('/')
    sign_up
    fill_in('comment', with: 'This is a peep')
    click_button('Peep This!')
    expect(page).to have_content('This is a peep')
  end

end
