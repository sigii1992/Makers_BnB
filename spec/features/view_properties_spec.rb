require 'pg'

feature 'View all properties' do
  scenario 'A user can see all properties' do

    #add the test data
    Property.create('Buckingham Palace', "Big old house, one old lady currently inhabiting", 10)

    visit('/')
    click_button('View Properties')
    visit('/properties')
    expect(page).to have_content('Buckingham Palace')
  end
end
