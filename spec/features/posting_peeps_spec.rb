feature '#Posting peeps' do
  scenario 'Users can post peeps with content displayed' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    expect(page).to have_content('Insert your peep here:')
    peep = create(:peep, user: user)
    visit('/peeps')
    expect(page).to have_content('Coding is fun')
    expect(page).to have_content("#{peep.user.username}")
  end

  scenario 'Users can post peeps with username displayed' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    expect(page).to have_content('Insert your peep here:')
    fill_in('peep', with: 'Hey!')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content("#{user.username}")
  end

  scenario 'Users can post peeps with name displayed' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    expect(page).to have_content('Insert your peep here:')
    fill_in('peep', with: 'Hey!')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content("#{user.name}")
  end

  scenario 'Users cannot post peeps when not logged in' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hey!')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Please sign up or login first!')
  end

  scenario 'Users will see peeps ordered chronologically' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    fill_in('peep', with: 'Coding is fun')
    click_button('Submit')
    visit('/peeps/new')
    fill_in('peep', with: 'Capybara tests needs refactoring')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    within 'ul#peeps li:nth-child(1)' do
      expect(page).to have_content('Capybara tests needs refactoring')
    end
    within 'ul#peeps li:nth-child(2)' do
      expect(page).to have_content('Coding is fun')
    end
  end

  scenario 'Peeps contain time at which it is created' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    fill_in('peep', with: 'Potato')
    click_button('Submit')
    within 'ul#peeps' do
      expect(page).to have_content("#{Time.new.strftime("%I:%M %p")}")
    end
  end

  scenario 'Users can directly reply to peeps' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    fill_in('peep', with: 'Coding is fun')
    click_button('Submit')
    click_button('Reply')
    expect(current_path).to eq('/peeps/new')
    within '#input_peep' do
      expect(page).to have_field('peep', with: '@testing_123')
    end
  end
end