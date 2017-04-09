feature 'User creates peeps' do
  scenario 'form enables peep to be submitted' do
    sign_up
    sign_in
    click_button('Peep')
    fill_in(:content, with: 'Shout out to the fans!')
    click_button('Peep')

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Peeper: Wizard_Trish')
      expect(page).to have_content('Shout out to the fans!')
    end
  end
end
