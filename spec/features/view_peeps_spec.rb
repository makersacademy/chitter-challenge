feature "Peeps apear in reverse chronological order" do
  scenario '-- peeps apear in reverse chronological order' do
    visit('/signup')
    fill_in('email', with: 'maker@yahoo.com')
    fill_in('password', with: 'secret')
    fill_in('name', with: 'Fake Name')
    fill_in('username', with: 'Bruce Banner')
    click_on 'Sign up'
    fill_in('content', with: 'This is my first peep')
    click_on 'Post'
    fill_in('content', with: 'This is my second peep')
    click_on 'Post'
    expect(page).to have_content("This is my second peep", "This is my first peep")
  end

  scenario '-- each peep has a timestamp' do
    visit('/signup')
    fill_in('email', with: 'maker@yahoo.com')
    fill_in('password', with: 'secret')
    fill_in('name', with: 'Fake Name')
    fill_in('username', with: 'Bruce Banner')
    click_on 'Sign up'
    fill_in('content', with: 'This is my first peep')
    click_on 'Post'
    expect(page).to have_content('Posted at:')
  end
end
