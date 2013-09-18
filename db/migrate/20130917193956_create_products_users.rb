class CreateProductsUsers < ActiveRecord::Migration
  def change
  	create_table :votes do |t|
  		t.integer "product_id"
  		t.integer "user_id"
  	end
  end
end
