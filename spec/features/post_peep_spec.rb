feature "Posting to Chitter" do
  scenario '-- a user can post a peep on Chitter' do
    visit('/')
    fill_in('content', with: 'This is my first peep')
    click_on 'Post'
    expect(page).to have_content 'This is my first peep'
  end
end
