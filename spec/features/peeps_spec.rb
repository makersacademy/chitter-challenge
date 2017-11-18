feature 'can view all peeps' do
  scenario 'any user can see all peep messages' do
    Peep.create(message: 'hello world', username: 'TestUser')
    visit('/')
    expect(page).to have_content('TestUser')
    expect(page).to have_content('hello world')
  end

  scenario 'each peep has a time & date stamp' do
    write_new_peep('What is the time?')
    time = Time.new.strftime("%H:%M")
    date = Time.new.strftime("%a-%d-%b-%Y")
    expect(page).to have_content(time)
    expect(page).to have_content(date)
  end
end
