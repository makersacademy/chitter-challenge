feature 'Post Peep' do
  scenario 'User can post a message (a peep) to the website' do
    sign_up
    # sign_in
    visit '/posts/new'
    fill_in 'message', with: 'A first peep!'
    click_button 'Add Peep'
    expect(page).to have_content 'A first peep!'
  end

  scenario 'Peeps show the user that posted them' do
    sign_up
    visit '/posts/new'
    fill_in 'message', with: 'A first peep!'
    click_button 'Add Peep'
    expect(page).to have_content 'A first peep! posted by johndoe'
  end
end
