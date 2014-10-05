require 'rails_helper'

feature 'User views classes' do
  scenario 'views all the classes' do
    user = create(:user)
    groups = create_list(:group, 2, user: user)
    login_as(user, scope: :user)

    visit '/'

    groups.each do |group|
      expect(page).to have_content(group.name)
    end
  end
end
