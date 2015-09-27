feature 'Creating peeps' do
  let(:user) { create(:user) }
  scenario 'User can create peeps' do
    sign_in(user)
    create_peep(user)
    within('table#peeps') do
      expect(page).to have_content 'Que sera sera'
    end
  end

  scenario 'When creating peep, the time at which it was made is stored' do
    sign_in(user)
    create_peep(user)
    within('table#peeps') do
      expect(page).to have_content("#{(Time.now).strftime("%H:%M %b %d %Y")}")
    end
  end

  scenario 'There are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

  scenario 'Without sign-in, user cannot post a peep' do
    expect { create_peep(user) }.not_to change(Peep, :count)
    expect(page).to have_content 'Please sign in'
  end
end

def sign_in(user)
  visit '/sessions/new'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Sign in'
end

def create_peep(user)
  visit "/users/#{user.id}/peeps/new"
  fill_in 'content', with: 'Que sera sera'
  click_button 'Chitter'
end
