feature 'User peep posting' do
  scenario 'signed in user posts peep' do
    create_user
    sign_in
    visit '/peeps/new'
    fill_in :message, with: 'This is a test peep'
    click_button 'Peep'
    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'bob.by'
    expect(Peep.count).to eq 1
  end
end

feature 'Peeps show up in reverse chronological order' do
  scenario 'Users view all peeps' do
    create_user
    sign_in
    create_peep(text: 'First Peep', time: Time.mktime(1))
    create_peep(text: 'Second Peep', time: Time.now)
    visit '/peeps/new'
    expect(find('.peep-list > div:nth-child(1)')).to have_content 'Second Peep'
    expect(find('.peep-list > div:nth-child(2)')).to have_content 'First Peep'
  end
end
