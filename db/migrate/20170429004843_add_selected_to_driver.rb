class AddSelectedToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :selected, :boolean, default: false
  end
end
