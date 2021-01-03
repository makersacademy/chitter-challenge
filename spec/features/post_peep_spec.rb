feature "posting a peep" do
  scenario "i can add a peep and then see it" do
    visit '/new_user'
    fill_in('email', with: 'ollie@ollie.com')
    fill_in('password', with: 'password')
    click_button('Submit')
    visit '/post_peep'
    fill_in('new_peep', with: 'test')
    click_button('Submit')
    expect(page).to have_content 'test'
    expect(page).not_to have_content 'ditty'
  end
end

feature "posting a peep" do
  scenario "it displays the timestamp of the Peep" do
    visit '/new_user'
    fill_in('email', with: 'ollie@ollie.com')
    fill_in('password', with: 'password')
    click_button('Submit')
    visit '/post_peep'
    fill_in('new_peep', with: 'test')
    click_button('Submit')
    expect(page).to have_content Time.new.year
    expect(page).not_to have_content 'ditty'
  end
end

feature "posting a peep" do
  scenario "it displays the author of the Peep" do
    visit '/new_user'
    fill_in('email', with: 'ollie@ollie.com')
    fill_in('password', with: 'password')
    click_button('Submit')
    visit '/post_peep'
    fill_in('new_peep', with: 'test')
    click_button('Submit')
    visit '/new_user'
    fill_in('email', with: 'different@email.com')
    fill_in('password', with: 'password')
    click_button('Submit')
    expect(page).to have_content 'ollie@ollie.com'
    expect(page).not_to have_content 'ditty'
  end
end