feature 'Viewing peeps' do
  scenario 'user can view list of peeps in reverse chronological order' do
    sign_up
    write_a_peep
    write_another_peep
    expect(page.status_code).to eq 200

    within 'ol#peeps' do
      expect(page).to have_content('Smelly cat')
      expect(page).to have_content('Lorem ipsum')
    end
  end

end
