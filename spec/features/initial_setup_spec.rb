require 'rails_helper'

feature 'Initial classes setup' do
  scenario 'the user is redirected to a welcome page' do
    user = create(:user)
    login_as(user, scope: :user)

    visit '/'

    expect(page.current_path).to eq('/setup/new')
    expect(page).to have_content('Bonjour')
  end

  scenario 'the user creates the first class' do
    user = create(:user)
    login_as(user, scope: :user)

    visit '/'
    fill_in 'Nom de la classe', with: 'Maths 1'
    click_button 'Ajouter cette classe'

    expect(page).to have_content('Maths 1')
  end
end
