feature "Posting to Chitter" do
  scenario '-- a user can post a peep on Chitter' do
    visit('/signup')
    fill_in('email', with: 'maker@yahoo.com')
    fill_in('password', with: 'secret')
    fill_in('name', with: 'Fake Name')
    fill_in('username', with: 'Bruce Banner')
    click_on 'Sign up'
    fill_in('content', with: 'This is my first peep')
    click_on 'Post'
    expect(page).to have_content 'This is my first peep'
  end
end
