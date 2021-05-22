feature 'Viewing peeps' do
  scenario "'/' route redirects to '/peeps'" do
    visit '/'
    expect(current_path).to eq('/peeps')
  end

  scenario 'A user can view peeps' do
    Peep.create(text: 'test peep 1')
    Peep.create(text: 'test peep 2')
    Peep.create(text: 'test peep 3')

    visit '/peeps'

    expect(page).to have_content('test peep 1')
    expect(page).to have_content('test peep 2')
    expect(page).to have_content('test peep 3')
  end
end