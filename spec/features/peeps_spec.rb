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

  scenario 'User cannot create an empty peep' do
    sign_up(user)
    visit('peeps/new')
    fill_in('peep', with: '')
    click_button('Peep')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Peep must not be blank')
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
    sign_up(user)
    create_peep('test')
    click_button('Log out')
    within 'ul#peeps' do
      expect(page).to have_content(Time.new.strftime("%I:%M %P %d-%m-%Y"))
    end
  end
end

feature 'Users can reply to other peeps' do
  let(:user) { build(:user) }

  scenario 'User can click reply and send a peep to the original peeper' do
    sign_up(user)
    create_peep('test')
    click_button('Reply')
    expect(current_path).to eq('/peeps/new')
    within '#peep_entry' do
      expect(page).to have_field('peep', with: '@foobar ')
    end
  end

  scenario 'User cannot reply to peeps when logged out' do
    sign_up(user)
    create_peep('test')
    click_button('Log out')
    within 'ul#peeps' do
      expect(page).not_to have_button('Reply')
    end
  end
end
