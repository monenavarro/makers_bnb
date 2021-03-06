feature 'Adding available dates' do
  scenario 'The host can provde a period with start and end dates to create availability' do
    user = User.create(
      email: 'johndoe@example.com',
      password: 'Password123'
    )
    visit '/sessions/new'
    fill_in("email", with: "johndoe@example.com")
    fill_in('password', with: 'Password123')
    click_on('Sign in')
    space = Space.create(name: 'Alexis pad', price: '150', description: 'Beautiful', user_id: user.id)
    visit '/spaces/availability'
    select "Alexis pad", :from => "space"
    fill_in "start_date", :with => "2022/05/28"
    fill_in "end_date", :with => "2022/06/30"
    click_button 'Submit'

    find('body').has_content? "Availability for Alexis pad has been added for 2022/05/28 to 2022/06/30"

  end

  scenario 'An new availability is not added if it already exists' do
    user = User.create(
      email: 'johndoe@example.com',
      password: 'Password123'
    )
    visit '/sessions/new'
    fill_in("email", with: "johndoe@example.com")
    fill_in('password', with: 'Password123')
    click_on('Sign in')
    space = Space.create(name: 'Alexis pad', price: '150', description: 'Beautiful', user_id: user.id)
    visit '/spaces/availability'
    select "Alexis pad", :from => "space"
    fill_in "start_date", :with => "2022/05/28"
    fill_in "end_date", :with => "2022/06/30"
    click_button 'Submit'

    visit '/spaces/availability'
    select "Alexis pad", :from => "space"
    fill_in "start_date", :with => "2022/05/28"
    fill_in "end_date", :with => "2022/06/30"
    click_button 'Submit'

    expect(Availability.find("2022/05/28", space.id).ntuples).to eq 1


  end
end