feature 'Viewing peep list' do
  scenario 'Homepage shows peep list' do
    sign_up_correctly
    write_peep
    peep = Peep.first
    expect(page).to have_content(peep.text)
  end

  scenario 'Peeps display author name' do
    sign_up_correctly
    write_peep
    peep = Peep.first
    expect(page).to have_content(peep.user.name)
  end

  scenario 'Peeps display time of peep' do
    sign_up_correctly
    write_peep
    peep = Peep.first
    expect(page).to have_content(peep.time_string)
  end

end
