require 'rails_helper'

RSpec.describe Item, type: :feature do
  it 'creates a new inventory item' do 
    visit new_item_path 

    fill_in :name, with: 'New Item'
    fill_in :description, with: 'A description'
    fill_in :quantity, with: 20
    
    click_on 'Create Item'

    expect(current_path).to eq(items_path)
    expect(page).to have_content('New Item')
    expect(page).to have_content('A description')
    expect(page).to have_content(20)
    expect(page).to have_content('In stock')
  end

  it 'cannot create a new inventory item with missing input' do 
    visit new_item_path

    click_on 'Create Item'

    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Name can't be blank, Description can't be blank, Quantity can't be blank, Quantity is not a number, and Quantity is not a number")
  end
end