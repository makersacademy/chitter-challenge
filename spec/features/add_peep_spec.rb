feature 'peeps' do
  scenario 'user can add a peep' do
    visit('/peeps')
    fill_in('body', with: '#waffles')
    click_button('post')
    expect(page).to have_content('#waffles')
  end
end
