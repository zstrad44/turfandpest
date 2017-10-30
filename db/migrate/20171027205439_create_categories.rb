class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.references :category
      t.string :features, array: true, default: []
      t.text :description
      t.string :size
      t.string :size_options, array: true, default: []
      t.string :manufacturer
      t.string :brand
      t.string :origin
      t.string :active_ingredient
      t.text :disclaimer
      t.text :target_pests, array: true, default: []
      t.text :tags, array: true, default: []
      t.text :product_images, array: true, default: []
      t.boolean :featured
      t.boolean :listed
      t.boolean :available
      t.integer :amount_available
      t.decimal :price, :precision => 10, :scale => 2
      t.decimal :cost, :precision => 10, :scale => 2
      t.decimal :shipping_cost, :precision => 10, :scale => 2
      t.boolean :display_price
      t.boolean :pet_safe
      t.string :upc
      t.decimal :weight, :precision => 10, :scale => 2
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.integer :subject
      t.text :tags, array: true, default: []
    end

    create_join_table :categories, :products do |t|
      t.index [:category_id, :product_id]
    end
  end
end
