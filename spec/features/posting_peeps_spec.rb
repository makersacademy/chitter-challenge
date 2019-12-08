feature "posting peeps" do
  scenario "entering a text and submiting it to be seen on the homepage" do
    visit '/'

    fill_in 'peep_text', with: 'This is my first test peep'
    click_button 'Post'

    expect(page).to have_content 'This is my first test peep'
  end

  scenario "Posts should be shown in reverse chronological order" do
    visit '/'

    fill_in 'peep_text', with: 'This is my first test peep'
    click_button 'Post'

    sleep(1.5)

    fill_in 'peep_text', with: 'This is a later test peep'
    click_button 'Post'

    expect(page.body.index('This is my first test peep')).to be > page.body.index('This is a later test peep')
  end

  scenario "time of post should be displayed" do
    visit '/'

    fill_in 'peep_text', with: "This is my post"
    time = Time.now
    click_button 'Post'

    expect(page).to have_content time.strftime '%H:%M %d/%m/%y'
  end
end
