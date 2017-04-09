feature 'User creates peeps' do

  scenario 'form enables peep to be submitted' do
    sign_up
    sign_in
    fill_in(:content, with: 'Shout out to the fans!')
    click_button('Peep')

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Shout out to the fans!')
    end
  end

  scenario 'multiple peeps created' do
    user = User.create(name: 'tester',
                       username: 'tester99',
                       email: 'test@test.com',
                       password: 'test',
                       password_confirmation: 'test')

    Peep.create(content: "I see trees of green",
                created_at: Time.now)
    Peep.create(content: "Red roses too",
                created_at: Time.now)
    Peep.create(content: "The circle",
                created_at: Time.now)

    expect(Peep.count).to eq(3)
    visit '/peeps'
    expect(page).to have_content("I see trees of green")
  end

end
