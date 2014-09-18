require 'spec_helper'

feature 'User signs out' do
  scenario 'from the home page' do
    user = create(:user)
    login_as(user, scope: :user)

    visit '/'
    click_link 'Déconnexion'

    expect(page).not_to have_content(user.name)
    expect(page).to have_content('Se connecter')
  end
end
