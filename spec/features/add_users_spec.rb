require 'pg'

feature 'register new user' do 
  scenario 'a user can be added to the database' do
    connection = PG.connect(dbname: 'makersbnb_test')

    visit('/')
    click_link('sign up')
    visit('/users/new')
    fill_in :name, with: 'Hagrid'
    fill_in :email, with: 'hagrid@gmail.com'
    fill_in :password, with: 'hagrid123'
    click_button('Register')
    visit('/users/thankyou')
    expect(page).to have_content 'Thank you for signing up. Please return to the home page to log in.'

  end
end

