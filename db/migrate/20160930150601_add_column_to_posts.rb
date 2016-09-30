class AddColumnToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :completed_at, :datetime
    add_column :posts, :range, :string, default: "public"
  end
end
