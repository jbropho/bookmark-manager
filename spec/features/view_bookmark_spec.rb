feature 'a link can be viewed' do
  scenario 'user chooses bookmark to be viewed' do
    Database::add_test_data
    visit('/bookmarks')
    expect(page).to have_content('http://www.github.com')
  end
end
