class SettingsController < ApplicationController
  def product_management
    @category = Category.new
    @product = Product.new
    @products = Product.all
    @categories = Category.all
  end
end
