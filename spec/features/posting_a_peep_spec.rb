feature 'Post a peep' do
  scenario 'I can create a new peep' do
    user = create(:user)
    sign_in(user)
    visit '/peeps/new'
    fill_in 'message', with: 'Hello world!'
    click_button 'Post'
    expect(current_path).to eq('/peeps')
    within 'div#peeps' do
      expect(page).to have_content('Hello world!')
      expect(page).to have_content('Rebecca')
      expect(page).to have_content('katylouise')

    end
  end

end
