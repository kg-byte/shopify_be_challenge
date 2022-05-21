require 'rails_helper'

RSpec.describe Item, type: :feature do
  it 'displays a list of items' do 
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

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
end