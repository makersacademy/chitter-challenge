feature 'User creates peeps' do

  before do
    sign_up
  end
  scenario 'form enables peep to be submitted' do
    create_peep('Shout out to the fans!')

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Shout out to the fans!')
      expect(page).to have_content('Peeped by: Wizard_Trish')
    end
  end

  def create_peep(message)
    visit '/peeps'
    fill_in(:content, with: message)
    click_button('Peep')
  end

end
