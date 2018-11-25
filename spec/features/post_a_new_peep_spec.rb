feature 'Posting a new peep' do

  scenario 'A user can post a new peep' do

    visit('/peeps/new')
    fill_in('user_name', with: 'darryl')
    fill_in('text', with: 'This is a brand new peep!')
    click_button('Submit')

    expect(page).to have_content 'This is a brand new peep!'

  end
end
