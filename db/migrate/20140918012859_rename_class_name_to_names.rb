class RenameClassNameToNames < ActiveRecord::Migration
  def change
    rename_column :groups, :class_name, :name
  end
end
