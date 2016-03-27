feature 'User peep posting' do
  scenario 'signed in user posts peep' do
    create_user
    sign_in
    visit '/peeps/new'
    fill_in :message, with: 'This is a test peep'
    click_button 'Peep'
    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'bob.by'
    expect(Peep.count).to eq 1
  end
end
