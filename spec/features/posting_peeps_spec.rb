feature "posting peeps" do
  scenario "entering a text and submiting it to be seen on the homepage" do
    visit '/'

    fill_in 'peep_text', with: 'This is my first test peep'
    click_button 'Post'

    expect(page).to have_content 'This is my first test peep'
  end
end
