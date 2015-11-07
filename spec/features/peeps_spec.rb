feature 'Peeps' do
  scenario 'be able to send peeps' do
    register
    sign_in
    peep
    expect(page).to have_content("Hello world")
  end

  scenario 'be able to send multiple peeps' do
    register
    sign_in
    peep
    peep2
    expect(page).to have_content('Hello world')
    expect(page).to have_content('Does this work?')
  end
end