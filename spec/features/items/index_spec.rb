require 'rails_helper'

RSpec.describe Item, type: :feature do
  let!(:item1) {create(:item)}
  let!(:item2) {create(:item)}
  let!(:item3) {create(:item)}

  it 'displays a list of items' do 
    visit items_path 

    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.quantity)
    expect(page).to have_content(item1.status)
    expect(page).to have_content(item2.name)
    expect(page).to have_content(item2.description)
    expect(page).to have_content(item2.quantity)
    expect(page).to have_content(item2.status)
    expect(page).to have_content(item3.name)
    expect(page).to have_content(item3.description)
    expect(page).to have_content(item3.quantity)
    expect(page).to have_content(item3.status)
  end

  it 'has a link to create a new item' do 
    visit items_path 

    click_on 'Create New Item'

    expect(current_path).to eq(new_item_path)
  end

  it 'has a button to edit an existing item' do 
    visit items_path

    within ".item-#{item1.id}" do
      click_on 'Edit'
    end

    expect(current_path).to eq(edit_item_path(item1))
  end

  it 'has a button to delete an existing item' do 
    visit items_path

    within ".item-#{item1.id}" do
      click_on 'Delete'
    end

    expect(current_path).to eq(items_path)
    within('.active_items') do 
      expect(page).to_not have_content(item1.name)
      expect(page).to_not have_content(item1.description)
      expect(page).to_not have_content(item1.quantity)
    end

    within('.deleted_items') do 
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.quantity)
    end
  end

  it 'has a button to restore a deleted item' do 
    visit items_path

    within ".item-#{item1.id}" do
      click_on 'Delete'
    end

    expect(current_path).to eq(items_path)
    within('.active_items') do 
      expect(page).to_not have_content(item1.name)
      expect(page).to_not have_content(item1.description)
      expect(page).to_not have_content(item1.quantity)
    end

    within('.deleted_items') do 
      click_on 'Restore'
    end

    expect(current_path).to eq(items_path)
    within('.active_items') do 
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item1.quantity)
    end
  end

  it 'has a button to permanently delete a deleted item' do 
    visit items_path

    within ".item-#{item1.id}" do
      click_on 'Delete'
    end


    within('.deleted_items') do 
      click_on 'Delete'
    end

    expect(current_path).to eq(items_path)
    
      expect(page).to_not have_content(item1.name)
      expect(page).to_not have_content(item1.description)
      expect(page).to_not have_content(item1.quantity)
  
  end
end