feature 'peeps with timestamp' do
  scenario 'see all peeps on homepage with timestamp' do
    add_test_peeps
    today = Time.new.strftime("%Y-%m-%d %H:%M")
    expect(page).to have_content(today)
  end
end
