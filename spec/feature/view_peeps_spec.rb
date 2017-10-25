feature 'View peeps' do

  scenario 'View own peeps on the peeps page' do
    sign_up
    create_peep('A test peep')

    within 'ul#peeps' do
      expect(page).to have_content('A test peep')
    end
  end
end
