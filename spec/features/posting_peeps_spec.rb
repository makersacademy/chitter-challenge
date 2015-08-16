feature '#Posting peeps' do
  scenario 'Users can post peeps with content displayed' do
    user = create(:user)
    sign_in_as(user)
    visit('/peeps/new')
    expect(page).to have_content('Insert your peep here:')
    fill_in('peep', with: 'Hey!')
    click_button('Submit')
    expect(current_path).to eq('/peeps')
    expect(page).to have_content('Hey!')
    expect(page).to have_content("#{user.username}")
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
    peep = create(:peep, time: Time.new.strftime("%I:%M %p"))
    peep2 = create(:peep, content: "Coffee was great!", time: (Time.new + 1800).strftime("%I:%M %p"))
    visit('/peeps')
    within 'ul#peeps li:nth-child(1)' do
      expect(page).to have_content(peep2.time)
    end
    within 'ul#peeps li:nth-child(2)' do
      expect(page).to have_content(peep.time)
    end
  end
end