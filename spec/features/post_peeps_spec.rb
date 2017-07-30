feature 'Posting peeps' do
  scenario 'User can post a peep to chitter' do
    post_peep
    expect(page).to have_content('My first peep!')
  end
end
