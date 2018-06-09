# As a user
# So that I can let people know what I think of a film
# I want to post a film to faldo-movie-ratings.

feature 'Add a film' do
  scenario 'User can add a film' do
    visit("/")
    add_film_with_rating("Example Film Title", "8")

    expect(page).to have_content("Example Film Title")
    expect(page).to have_content("8/10")
  end

  feature 'Validates user input' do
    scenario 'user doesnt enter rating' do
      visit("/")
      add_film_without_rating("Example Film Title")

      expect(page).to have_content("You must enter all fields to submit")
      expect(page).not_to have_content("Example Film Title")
    end
    scenario 'user doesnt enter title' do
      visit("/")
      add_film_rating_without_title("7")

      expect(page).to have_content("You must enter all fields to submit")
      expect(page).not_to have_content("7")
    end
    scenario 'user puts in rating over 10' do
      visit("/")
      add_film_with_rating("Example Film Title", "11")
      # Verify
      expect(page).to have_content("You must enter all fields to submit")
      expect(page).not_to have_content("11")
    end
    scenario 'user puts in rating under 0' do
      visit("/")
      add_film_with_rating("Example Film Title", "-10")

      expect(page).to have_content("You must enter all fields to submit")
      expect(page).not_to have_content("-10")
    end
    xscenario 'user puts in rating that isnt a number' do

    end
    xscenario 'user gets flash that says error specific message' do
      # e.g. rating must be below 10 (and not generic must enter all fields)
    end
  end

  def add_film_with_rating(title, rating)
    click_button("addfilm")
    fill_in("title", with: "#{title}")
    fill_in("rating", with: "#{rating}")
    click_button("Submit")
  end

  def add_film_without_rating(title)
    click_button("addfilm")
    fill_in("title", with: "#{title}")
    click_button("Submit")
  end

  def add_film_rating_without_title(rating)
    click_button("addfilm")
    fill_in("rating", with: "#{rating}")
    click_button("Submit")
  end
end
