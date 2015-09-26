feature 'Creating peeps' do
  scenario 'User can create peeps' do
    user = create(:user)
    sign_in(user)
    create_peep
    within('ul#peeps') do
      expect(page).to have_content 'Que sera sera'
    end
  end

  scenario 'When creating peep, the time at which it was made is stored' do
    user = create(:user)
    sign_in(user)
    create_peep
    within('ul#peeps') do
      expect(page).to have_content("#{Time.now}")
    end
  end

  scenario 'There are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

  scenario 'Without sign-in, user cannot post a peep' do
    expect { create_peep }.not_to change(Peep, :count)
    expect(page).to have_content 'Please sign in'
  end
end

def sign_in(user)
  visit '/sessions/new'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Sign in'
end

def create_peep
  visit '/peeps/new'
  fill_in 'content', with: 'Que sera sera'
  click_button 'Chitter'
end
