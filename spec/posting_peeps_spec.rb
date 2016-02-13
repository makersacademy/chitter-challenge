# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Posting peeps' do
  let!(:user) do
    User.create(name: 'Samuel Russell Hampden Joseph',
                username: 'tansaku',
                email: 'sam@makersacademy.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  scenario 'I can post a new peep' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    fill_in :message, with: 'I am a peep.'
    click_button 'peep'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content "#{user.name}"
      expect(page).to have_content "#{user.username}"
      expect(page).to have_content 'I am a peep'
    end
  end
end