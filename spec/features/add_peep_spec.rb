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
    click_link 'Peep'
    expect(page).to have_content "Compose Peep"
    fill_in "content", with: "My first peep"
    click_button 'Add Peep'
    expect(page).to have_content "Peeps"
    expect(page).to have_content "My first peep"
  end
end
