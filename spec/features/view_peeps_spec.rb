feature 'Viewing peep list' do
  scenario 'Homepage shows peep list' do
    sign_up_correctly
    write_peep
    peep = Peep.first
    expect(page).to have_content(peep.text)

  end


end
