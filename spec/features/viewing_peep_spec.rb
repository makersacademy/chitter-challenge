feature 'Viewing peeps' do
  scenario "'/' route redirects to '/peeps'" do
    visit '/'
    expect(current_path).to eq('/peeps')
  end

  scenario 'A user can view peeps' do
    now = Time.now.strftime("%F %T")
    Peep.create(text: 'test peep 1', posted: now)
    Peep.create(text: 'test peep 2', posted: now)
    Peep.create(text: 'test peep 3', posted: now)

    visit '/peeps'

    expect(page).to have_content("test peep 1 - #{now}")
    expect(page).to have_content("test peep 2 - #{now}")
    expect(page).to have_content("test peep 3 - #{now}")
  end
end