describe 'Add and view peep' do

  let!(:user) do
    User.create(name: 'David',
                username: 'sadfacedave',
                email: 'dave@test.com',
                password: '1234')
  end

  scenario "I can add a peep" do
    sign_in(email: user.email,
            password: '1234')
    visit '/peeps/new'
    fill_in 'peep', with: "I'm peeping all over the place"
    click_button 'Add peep'
    expect(page).to have_content "I'm peeping all over the place"
  end
end
