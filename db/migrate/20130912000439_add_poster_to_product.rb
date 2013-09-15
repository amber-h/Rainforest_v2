class AddPosterToProduct < ActiveRecord::Migration
  def change
    add_column :products, :poster_name, :string
  end
end
