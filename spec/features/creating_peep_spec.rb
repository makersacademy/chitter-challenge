feature 'Posting peeps' do
  scenario 'the User can add a peep which appears on the page' do
    visit('/peeps')
    click_button('Create a Peep')
    fill_in('content', with: 'Love to Peep!')
    click_button('Peep!')

    expect(page).to have_content 'Love to Peep!'
  end
end
