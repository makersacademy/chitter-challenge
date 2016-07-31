feature 'Posting peeps' do

  scenario 'I can post a peep on chitter' do
    sign_up
    sign_in(username: "acsauk", password: "abcd")
    visit '/peeps/new'
    fill_in 'peep', with: "This is my first peep!"
    click_button 'Send Peep'

    expect(current_path).to eq '/peeps/feed'

    within 'ul#peep' do
      expect(page).to have_content("This is my first peep!")
    end
  end
end
