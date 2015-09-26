feature 'Viewing peeps' do
  scenario 'I can view peep on the screen' do
    user = create(:user)
    peep = Peep.create(content: 'TGI Friday!')
    peep.user_id = user.id
    peep.save
    visit '/peeps'
    expect(page.status_code).to eq 200
    within('ul#peeps') do
      expect(page).to have_content("TGI Friday!")
    end
  end
end
