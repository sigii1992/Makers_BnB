require 'pg'

feature 'View all properties' do
  scenario 'A user can see all properties' do
    connection = PG.connect(dbname: 'makersbnb_test')
    #add the test data
    Property.create(name: 'Buckingham Palace', description: "Big old house, one old lady currently inhabiting", price_per_night: 10)

    visit('/')
    click_button('View Properties')
    visit('/properties')
    expect(page).to have_content('Buckingham Palace')
  end
end
