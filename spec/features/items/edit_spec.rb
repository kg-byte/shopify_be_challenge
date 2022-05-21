require 'rails_helper'

RSpec.describe Item, type: :feature do
  let!(:item) {create(:item)}
  it 'updates a new inventory item' do 

    visit edit_item_path(item)

    fill_in :name, with: 'New Item'
    fill_in :description, with: 'A description'
    fill_in :quantity, with: 20
    click_on 'Update Item'

    expect(current_path).to eq(items_path)
    expect(page).to have_content('New Item')
    expect(page).to have_content('A description')
    expect(page).to have_content(20)
    expect(page).to have_content('In stock')
    expect(page).to_not have_content(item.name)
    expect(page).to_not have_content(item.description)
    expect(page).to_not have_content(item.quantity)
  end

  it 'cannot update a new inventory item with missing input' do 
    visit edit_item_path(item)

    fill_in :name, with: ''
    fill_in :description, with: ''
    fill_in :quantity, with: ''
    
    click_on 'Update Item'

    expect(current_path).to eq(edit_item_path(item))
    expect(page).to have_content("Name can't be blank, Description can't be blank, Quantity can't be blank, Quantity is not a number, and Quantity is not a number")
  end
end