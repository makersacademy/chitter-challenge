feature 'FEATURE: adding peep' do
  scenario 'user can create peep if signed in' do
    sign_up
    create_peep(content: 'Hi')
    expect(page).to have_content 'Hi'
  end

  scenario 'user cannot create peep if not signed in' do
    visit 'peeps/new'
    expect(page).to have_content 'You must log in to peep!'
  end
end
