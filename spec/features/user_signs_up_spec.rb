require 'spec_helper'

feature 'User signs up' do
  scenario 'from the home page' do
      user = build(:user)

      visit '/'
      click_link "S'inscrire"
      fill_in 'Email', with: user.email
      fill_in 'Mot de passe', with: user.password
      fill_in 'Confirmation', with: user.password
      click_button 'Créer mon compte'

      expect(page).to have_content(t('devise.registrations.signed_up'))
  end
end
