feature 'Creating peeps' do
  let(:user) { build(:user) }

  scenario 'User can only create a new peep when logged in' do
    sign_up(user)
    create_peep('test')
    expect(current_path).to eq('/')
    within 'ul#peeps' do
      expect(page).to have_content('test')
      expect(page).to have_content('Peeped by Foo Bar @foobar')
    end
  end

  scenario 'User cannot create a new peep when not logged in' do
    visit('/peeps/new')
    expect(current_path).to eq('/')
    expect(page).to have_content('Please sign up or sign in first!')
  end
end

feature 'Viewing peeps when logged out' do
  let(:user) { build(:user) }
  let(:user2) { build(:user, email: 'foo2@bar.com', user_name: 'foobar2') }

  scenario 'The peeps are shown in reverse chronological order' do
    sign_up(user)
    create_peep('test1')
    click_button('Log out')
    sign_up(user2)
    create_peep('test2')
    click_button('Log out')
    expect(current_path).to eq('/')
    within 'ul#peeps li:nth-child(1)' do
      expect(page).to have_content('test2')
    end
    within 'ul#peeps li:nth-child(2)' do
      expect(page).to have_content('test1')
    end
  end

  scenario 'The peeps have a timestamp' do
    time = Time.new
    sign_up(user)
    create_peep('test')
    Peep.last.update(time: time)
    create_peep('test')
    Peep.last.update(time: time + 3600)
    within 'ul#peeps li:nth-child(1)' do
      expect(page).to have_content((time + 3660).strftime("%I:%M %p"))
    end
    within 'ul#peeps li:nth-child(2)' do
      expect(page).to have_content(time.strftime("%I:%M %p"))
    end
  end
end
