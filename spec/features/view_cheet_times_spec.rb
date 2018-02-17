feature 'Cheet times visible on homepage' do
  scenario 'on homepage, see cheet times' do
    visit '/cheets'
    time1 = Time.now.strftime('%R - %F')
    expect(page).to have_content time1
  end
end
