feature 'posting' do
  scenario 'I want post a peep to chitter' do
    sign_up
    creating_peep
    within 'ul#peeps' do
      expect(page).to have_content 'what a fabulous day'
    end
  end
end
