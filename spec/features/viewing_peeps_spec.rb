feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(message: "This is my first peep")
    visit '/peeps'

    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content("This is my first peep")
    end
  end

  scenario 'Filter by hashtags' do
    sign_up
    create_a_peep
    visit '/peeps/new'
    fill_in 'message', with: 'Another peep with a different hashtag'
    fill_in 'hashtags', with: 'gaming'
    click_button 'Post Peep!'
    visit '/hashtags/gaming'
    expect(page.status_code).to eq 200
    expect(page).not_to have_content("first")
    expect(page).to have_content("gaming")
  end

  scenario 'Shows name' do
    sign_up
    create_a_peep
    expect(page).to have_content("pete@example.com")
  end

  scenario 'Shows username' do
    sign_up
    create_a_peep
    expect(page).to have_content("peteypops")
  end
end
