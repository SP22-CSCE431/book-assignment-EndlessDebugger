# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Life cyle of a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Date', with: '2019-10-23'
    fill_in 'Price', with: '13.49'
    click_on 'Create Book'

    expect(page).to have_content('harry potter')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content('13.49')
    expect(page).to have_content('10/23/2019')

     # visit edit_book_path
    click_on 'Edit'
    fill_in 'Title', with: 'harry potter 10: The secrets we never knew'
    click_on 'Update'
    expect(page).to have_content('harry potter 10: The secrets we never knew')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content('13.49')
    expect(page).to have_content('10/23/2019')

    visit books_path
    expect(page).to have_content('harry potter 10: The secrets we never knew')

  end

  scenario 'blank inputs' do
    visit new_book_path
    click_on 'Create Book'
    expect(page).to have_content('Title can\'t be blank')
  end
end
