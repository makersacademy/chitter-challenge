feature 'posting a peep' do
    scenario 'user can post message to site' do
    visit('/')
    fill_in('peep', with: 'test_peep')
    click_button('Post')
    expect(page).to have_content('test_peep')
    end
end