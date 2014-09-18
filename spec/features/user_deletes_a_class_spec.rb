require 'spec_helper'

feature 'User update classes settings' do
  scenario 'updates a class' do
    user = create(:user)
    group = create(:group, user: user)
    login_as(user, scope: :user)

    visit '/'
    find(:xpath, "//a[@href='#{edit_group_path(group)}']").click
    click_link 'supprimer'

    expect(page).not_to have_content(group.name)
  end
end
