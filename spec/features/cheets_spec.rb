feature 'Viewing cheets' do
  scenario 'A user can see cheets' do
    visit('/cheets')

    expect(page).to have_content "Being methodical and sensible"
    expect(page).to have_content "I stick to the pomodoro technique"
    expect(page).to have_content "To get much done in little time"
  end
end
