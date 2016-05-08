feature 'post a new peep' do

  let(:user) do
    User.create(name: 'Chris',
                username: 'chrischit',
                email: 'chris@email.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'signed in user can post a new peep' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    fill_in :message,   with: 'This is a test peep 1'
    click_button 'Peep!'

    within 'ul#peeps' do
      expect(page).to have_content("#{user.name}")
      expect(page).to have_content("#{user.username}")
      expect(page).to have_content('This is a test peep 1')
      expect(page).to have_content("#{Time.now.strftime("%Y-%m-%d %H:%M")}")
    end
  end

  scenario "cannot write a peep if not logged in" do
    sign_up
    sign_out
    visit "/peeps/new"
    expect(page).to have_content "Please login in order to peep"
  end
end