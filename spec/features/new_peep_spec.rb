feature 'Posting a new peep' do

  let(:user) do
    User.create(name: 'Aday Mesa',
      username: 'adaymesa',
      email: 'adaymesagc@gmail.com',
      password: 'yipiyey!',
      password_confirmation: 'yipiyey!')
  end

  scenario 'Allow signed user to post a peep' do
    sign_in(username: user.username,   password: user.password)
    visit '/peeps/new'
    fill_in :peep,   with: 'Am I peeping?'
    click_button 'Peep!'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content("Am I peeping?")
      expect(page).to have_content("#{user.name}")
      expect(page).to have_content("#{user.username}")
      expect(page).to have_content("#{Time.now.strftime("%H:%M %d/%m/%Y")}")
    end
  end
end
feature 'Have to be signed in to post to Chitter' do
  scenario 'cannot post peep if not signed in' do
    expect{create_peep}.not_to change(Peep, :count)
  end

end