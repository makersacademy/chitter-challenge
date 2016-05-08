feature 'Viewing peeps' do
  scenario 'see peeps from all users' do
    sign_up
    create_peep
    create_peep(message: "2nd peep")
    expect(page).to have_content "My first peep"
    expect(page).to have_content "2nd peep"
  end
end

feature 'see all peeps in reverse chronological order' do
  scenario 'new peeps are shown first' do
    sign_up
    create_peep
    sleep 0.02
    create_peep(message: "2nd peep")
    expect("My first peep").to appear_before("2nd peep")
  end
end