feature "Peeps apear in reverse chronological order" do
  scenario '-- peeps apear in reverse chronological order' do
    visit('/')
    fill_in('content', with: 'This is my first peep')
    click_on 'Post'
    fill_in('content', with: 'This is my second peep')
    click_on 'Post'
    expect(page).to have_content("This is my second peep\nThis is my first peep")
  end
end
