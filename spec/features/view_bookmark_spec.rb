feature 'a link can be viewed' do
  scenario 'user chooses bookmark to be viewed' do
    Database::add_test_data
    visit('/bookmarks')
    page.assert_selector(:link, nil, href: 'http://www.github.com')
  end
end
