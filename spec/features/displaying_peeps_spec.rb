feature 'Displaying Peeps' do
  let!(:user) { create_user }
  let!(:first_peep) do
    Peep.create(
      text: 'Test peep',
      created_at: '2000-01-01 00:00:00',
      user: User.first
      )
  end

  let!(:second_peep) do
    Peep.create(
      text: 'Second test peep',
      created_at: '2000-01-01 00:00:05',
      user: User.first
      )
  end

  background { visit '/' }

  scenario 'A user can see peeps in reverse chronological order' do
    expect('Second test peep').to appear_before 'Test peep'
  end

  scenario 'A user can see the time that a peep was created at' do
    expect(page).to have_content '01-01-00 00:00:00'
    expect(page).to have_content '01-01-00 00:00:05'
  end

  scenario 'A user can see who posted a particular peep' do
    expect(page).to have_content 'Joe King'
    expect(page).to have_content 'haha88'
  end
end
