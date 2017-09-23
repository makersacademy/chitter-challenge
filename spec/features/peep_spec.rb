feature 'peep' do
  scenario 'so that I can post a peep to chitter' do
    visit ('/peep')
    fill_in 'peep', with: "Too many peeping Toms are peeping"
    click_button 'Submit'
    #   expect(page.status_code).to eq 200
    # within 'ul#wall' do
      expect(page).to have_content("Too many peeping Toms are peeping")
    # end
  end
end
