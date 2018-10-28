feature 'posting a peep' do
  scenario 'should post a peep and add it to the homepage' do
    login
    fill_in('new_peep', with: 'This is a test peep')
    click_button('Post')
    expect(page).to have_content('This is a test peep')
  end
end
