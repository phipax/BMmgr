feature 'Checking for adding URL' do
  scenario 'Checking if a new url can be added' do
    visit('/')
    fill_in 'urlitem', with: "http://www.9gag.com"
    fill_in 'title', with: "Fun"
    click_button "Save"
    visit('/')
  #  expect(page).to have_content "http://www.google.com"
    expect(page).to have_link('Fun', href: 'http://www.9gag.com')
  end
end
