feature 'Viewing peeps' do
  scenario 'User can view peep on the screen' do
    user = create(:user)
    peep = Peep.create(content: 'TGI Friday!')
    peep.user_id = user.id
    peep.save
    visit "/users/#{user.id}/peeps"

    expect(page.status_code).to eq 200
    within('table#peeps') do
      expect(page).to have_content("TGI Friday!")
    end
  end
end
