require 'spec_helper'

feature 'User adds classes' do
  scenario 'adds a new class' do
    user = create(:user, :with_groups)
    login_as(user, scope: :user)

    visit '/'
    click_link 'Nouvelle classe'
    fill_in 'Nom', with: 'Super class'
    click_button 'Ajouter'

    expect(page).to have_content('Super class')
  end
end
