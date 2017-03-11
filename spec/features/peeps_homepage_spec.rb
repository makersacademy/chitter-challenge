feature 'Opening homepage' do
  xscenario 'Upon entering the webpage, whether I have an account or not, I want to see peeps in reverse chronological order' do
    visit('/')
    # add peeps
    expect(page).to have_content"Peeps 2" #2 showing at top
    expect(page).to have_content"Peeps 1" #1 showing at the bottom
  end
end
