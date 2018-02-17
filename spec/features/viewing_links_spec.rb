feature 'view peeps' do
  scenario 'peeper can view peeps' do
    visit '/'
    expect(page).to have_content '¡Día de partido! ¡Vamos Real, hasta el final!'
    expect(page).to have_content 'El bicho scores a hattrick!'
  end
end
