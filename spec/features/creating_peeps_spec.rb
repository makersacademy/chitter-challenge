feature 'posting peeps to chitter' do
  scenario 'creating peeps' do
    sign_up
    write_a_peep
    expect(page).to have_content 'Lorem ipsum'
  end
end
