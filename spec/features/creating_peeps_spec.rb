feature 'Creating peeps' do
  scenario 'User can create a peep' do
    sign_up
    create_peep
    expect(page).to have_content('Another peep!')
  end
end
