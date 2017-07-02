feature 'Creating peeps' do
  scenario 'I can create a peep' do
    sign_up
    create_peep
    expect(page).to have_content('Another peep!')
  end
end
