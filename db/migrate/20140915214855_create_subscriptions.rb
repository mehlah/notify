class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :group, index: true
      t.references :subscriber, index: true

      t.timestamps
    end
  end
end
