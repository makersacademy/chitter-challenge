feature 'create a new peep message' do
  scenario 'A user can create a new Peep message' do
    write_new_peep('hello world')
    expect(Peep.all.length).to eq(1)
    expect(page.current_url.ends_in?('/peeps')).to be(true)
    expect(page).to have_content('hello world')
    expect(page).to have_content('TestUser')
  end
end
