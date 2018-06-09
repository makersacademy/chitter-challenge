feature 'See date added' do
  scenario 'User can see when the film was added' do
    visit("/")
    add_film_with_rating("First Film", "8")

    expect(page).to have_content("First Film 8/10 #{Time.now.strftime("%d/%m/%Y")}")
  end
end
