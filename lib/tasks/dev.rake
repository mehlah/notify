namespace :dev do
  desc 'Creates sample data for local development'
  task prime: ['db:setup'] do
    unless Rails.env.development?
      raise 'This task can only be run in the development environment'
    end

    require 'factory_girl_rails'

    create_user
    create_groups
    create_messages
  end

  def create_user
    header 'Users'

    @user = FactoryGirl.create(:user, email: 'mehdi@craftsmen.io', password: 'password', name: 'Mr. Mehdi')
  end

  def create_groups
    header 'Groups with subscriptions'

    @group1 = FactoryGirl.create(:group, :with_subscriptions, name: 'CP', user: @user, subscriptions_count: 22)
    @group2 = FactoryGirl.create(:group, :with_subscriptions, name: 'CE1', user: @user, subscriptions_count: 18)
    @group3 = FactoryGirl.create(:group, :with_subscriptions, name: 'CE2', user: @user, subscriptions_count: 15)
    @group4 = FactoryGirl.create(:group, name: 'CM1', user: @user)
    @group5 = FactoryGirl.create(:group, :with_subscriptions, name: 'CM2', user: @user, subscriptions_count: 10)
  end

  def create_messages
    header 'Messages'

    FactoryGirl.create_list(:message, 6, group: @group1)
    FactoryGirl.create_list(:message, 12, group: @group2)
    FactoryGirl.create_list(:message, 3, group: @group3)
  end

  def header(msg)
    puts "Creating #{msg}\n"
  end
end
