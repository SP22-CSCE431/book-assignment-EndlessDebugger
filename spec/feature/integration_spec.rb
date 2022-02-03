# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Life cyle of a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J.K. Rowling'
    fill_in 'Date', with: 02/22/2022
    fill_in 'Price', with: 13.49
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')

    visit show_book_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content(13.49)
    expect(page).to have_content(02/22/2022)

    visit edit_book_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content(13.49)
    expect(page).to have_content(02/22/2022)
    fill_in 'Title', with: 'harry potter 10: The secrets we never knew'
    click_on 'Update'
    expect(page).to have_content('harry potter 10: The secrets we never knew')

    visit books_path
    expect(page).to have_content('harry potter 10: The secrets we never knew')

    click_on 'Destroy'
    expect(page).to have_content('Are you sure?')
    click_on 'OK'
    expect(page).to have_no_content('harry potter 10: The secrets we never knew')
  end

  scenario 'blank inputs' do
    visit new_book_path
    click_on 'Create Book'
    expect(page).to have_content('Title can\'t be blank')
  end
end
