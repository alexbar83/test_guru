class DropTableQuestion < ActiveRecord::Migration[6.1]
  def up
    drop_table :questions, if_exists: true
 end
end
