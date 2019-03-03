feature 'Peeps have a time and are in reverse chronological order' do
  scenario '3 peeps made at different times are odered corectly' do
    visit '/feed'
    expect(page.body).to have_content("2019-03-03 12:06")
    expect(page.body).to have_content("2019-03-03 11:06")
    expect(page.body).to have_content("2019-03-02 12:06")

  end
end
