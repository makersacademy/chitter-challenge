feature 'Can view all peeps to Chitter' do
  scenario 'can see peeps from all users' do
    sign_up
    create_peep
    create_peep(message = "2nd")
    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "2nd"
  end
end

feature 'peeps are listed in reverse chronological order' do
  scenario 'new peeps are shown first' do
    sign_up
    create_peep
    sleep 0.02
    create_peep(message = "2nd")
    expect("This is my first peep").to appear_before("2nd")
  end
end
