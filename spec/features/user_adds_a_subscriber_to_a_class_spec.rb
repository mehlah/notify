require 'rails_helper'

feature 'User adds subscribers to a class' do
  scenario 'adds a subscriber by filling the form' do
    user = create(:user, :with_groups)
    login_as(user, scope: :user)

    visit '/'
    click_link 'Ajouter des parents'
    fill_in 'Nom et prénom', with: 'John Doe'
    fill_in 'Numéro de téléphone', with: '0611223344'
    click_button 'Ajouter'

    within('#subscribers') do
      expect(page).to have_content('1 inscrit')
      expect(page).to have_link('John Doe')
    end
  end
end
