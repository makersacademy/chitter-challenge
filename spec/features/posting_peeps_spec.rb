feature 'User can post messages (peeps) to Chitter' do
  scenario 'User posts a peep and it appears in the feed' do
    sign_up
    sign_in
    visit '/feed'
    fill_in 'body', with: "This is a peep", visible: false
    click_button 'peep this'
    visit '/feed'
    expect(page).to have_content "This is a peep"
  end
end
