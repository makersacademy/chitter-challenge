feature 'Viewing chitter' do
  scenario 'a user can see peeps' do
    Peep.create(text: 'This is Peep 1')
    Peep.create(text: 'This is Peep 2')
    visit('/peeps')
    expect(page).to have_content "This is Peep 1"
    expect(page).to have_content "This is Peep 2"
  end

  scenario 'a user can see time peep was created' do
    peep = Peep.create(text: 'This is a Peep 1')
    visit('/peeps/new')
    fill_in 'peep', with: 'This is Peep 2'
    click_button 'Post'
    expect(current_path).to eq ('/peeps')
    expect(page).to have_content(/\d{2}:\d{2}:\d{2}/)
    expect(peep.created_at).to have_content(/\d{2}:\d{2}:\d{2}/)
  end
end
