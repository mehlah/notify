require 'spec_helper'

feature 'User signs in' do
  scenario 'from the home page' do
    user = create(:user)

    visit '/'
    click_link 'Se connecter'
    fill_in 'Adresse email', with: user.email
    fill_in 'Mot de passe', with: user.password
    click_button 'Se connecter'

    expect(page).to have_content(user.name)
    expect(page).to have_content('Se déconnecter')
  end
end
