require 'spec_helper'

feature 'User update classes settings' do
  scenario 'updates a class' do
    user = create(:user)
    group = create(:group, name: 'Old name', user: user)
    login_as(user, scope: :user)

    visit '/'
    find(:xpath, "//a[@href='#{edit_group_path(group)}']").click
    fill_in 'Nom', with: 'New name'
    click_button 'Enregistrer'

    expect(page).to have_content('New name')
  end
end
