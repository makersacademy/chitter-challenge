feature 'Can view all peeps to Chitter' do
  scenario 'sess peeps from all users' do
    sign_up
    create_peep
    create_peep(message = "2nd")
    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "2nd"
  end
end
