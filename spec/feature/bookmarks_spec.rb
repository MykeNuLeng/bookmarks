feature 'bookmarks list' do
  scenario 'it lists bookmarks' do
    visit '/'
    click_link "Bookmarks"
    expect(page).to have_content "Not porn"
  end
end
