feature ' posting peeps' do
  scenario 'user can add a peep' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hello')
    click_button('Post')
    expect(page).to have_content 'Hello'
  end
end