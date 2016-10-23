describe 'Add peep' do
  let!(:user) do
    User.create(name: "Mike",
                username: "Mickey-boy",
                email: 'mike@mike.com',
                password: '1234')
  end

  scenario "can add a peep" do
    sign_in(email: user.email,
            password: '1234')
    click_link 'Compose Peep'
    expect(page).to have_content "Compose Peep"
    fill_in "content", with: "My first peep"
    click_button 'Add Peep'
    expect(page).to have_content "Peeps"
    expect(page).to have_content "My first peep"
  end

  scenario "peep has time and date" do
    sign_in(email: user.email,
            password: '1234')
    click_link 'Peep'
    fill_in "content", with: "My first peep"
    Timecop.freeze do
      click_button 'Add Peep'
      expect(page).to have_content "#{Time.now.hour}:#{Time.now.min}"
    end
  end

  scenario "can't post peep if not logged in" do
    visit '/peeps/new'
    expect(page).not_to have_content "Compose Peep"
    expect(page).to have_content "You need to be logged in to post a peep"
  end
end
