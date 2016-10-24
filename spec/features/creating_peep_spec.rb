feature 'Creating peeps' do

  scenario 'The user can create a new peep' do
    visit '/'
    sign_up
    expect(page).to have_content('Newest peeps:')
  end
end
