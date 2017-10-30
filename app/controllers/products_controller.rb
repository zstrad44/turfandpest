class ProductsController < ApplicationController
    def new
        # @category = Category.find(params[:category_id])
        @product = Product.new
    end
    def edit
        @category = Category.find(params[:category_id])
        @product = @category.products.find(params[:id])
    end

    def create
        @category = Category.find(params[:category_id])
        @product = @category.products.build(product_params)
        respond_to do |format|
            if @product.save
                format.html { redirect_to product_management_path, notice: "Nice! You just added a new product!"}
                format.json { render :product_management, status: :created, location: @product }
            else
                format.html { render :new}
                format.json { render json: @product.errors, status: :unprocessable_entity }
                flash[:alert] = "Something wen't wrong! Please try again.."
                flash[:alert] = '<span class="bolder"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Error!&nbsp; Product Not Created Because: </span><br>' + @product.errors.full_messages.join("<br>").html_safe
            end
        end
    end

    def update
        @category = Category.find(params[:category_id])
        @product = @category.products.find(params[:id])
        respond_to do |format|
            if @product.update(product_params)
                format.html { redirect_to product_management_path, notice: "Nice! Product has been updated successfully!"}
                format.json { render :product_management, status: :updated, location: @product }
            else
                format.html { render :edit}
                format.json { render json: @product.errors, status: :unprocessable_entity }
                flash[:alert] = "Something wen't wrong! Please try again.."
                flash[:alert] = '<span class="bolder"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Error!&nbsp; Product Not Updated Because: </span><br>' + @product.errors.full_messages.join("<br>").html_safe
            end
        end
    end
    def destroy
        @category = Category.find(params[:category_id])
        @product = @category.products.find(params[:id])
        respond_to do |format|
            if @product.destroy
                format.html { redirect_to product_management_path, notice: "Product has been deleted successfully!"}
                format.json { render :product_management, status: :destroyed, location: @product }
            else
                format.html { redirect_to product_management_path }
                format.json { render json: @product.errors, status: :unprocessable_entity }
                flash[:alert] = "Something wen't wrong! Please try again.."
                flash[:alert] = '<span class="bolder"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Error!&nbsp; Product Not Deleted Because: </span><br>' + @product.errors.full_messages.join("<br>").html_safe
            end
        end
    end

    protected

        def product_params
            params.require(:name, :category_id, :description, :size, :manufacturer, :brand, :origin, :active_ingredient, :disclaimer, :featured, :listed, :available, :amount_available, :price, :cost, :shipping_cost, :display_price, :pet_safe, :upc, :weight,  target_pests: [], size_options: [],features: [], tags: [], product_images: [])
        end
end
