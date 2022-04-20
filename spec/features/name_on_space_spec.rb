feature 'Space has name' do
  scenario 'Each space will show the name of the space' do
    visit('/spaces')
    fill_in :name, with: "Strawberry Fields Cottage"
    fill_in :price, with: "150.00"
    fill_in :description, with: "Strawberry Fields Cottage is a"
    click_button('New Listing')
    expect(page).to have_content('Strawberry Fields Cottage')
  end
end