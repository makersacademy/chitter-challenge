
feature 'See peeps' do
  let!(:user) do
    User.create(email: 'salvini@padania.it',
                password: 'miao',
                password_confirmation: 'miao')
  end

  before do
    Peep.create(user_id: user.id,
                title: 'I secretly love Italy',
                content: 'I can say it now, in a foreign language but not in my home country that is why I am dying inside')
  end

  scenario 'Anyone can see public peeps' do
    visit('/')
    expect(page).to have_content "I secretly love Italy"
    expect(page).to have_content "I can say it now"
    expect(page).not_to have_content "Create a new Peep"
  end

  feature 'write peeps' do

    scenario 'Just signed in users can write posts' do
      visit('/')
      sign_in(email:user.email, password:user.password)
      expect(page).to have_content "Create a new Peep"
    end
  end
end
