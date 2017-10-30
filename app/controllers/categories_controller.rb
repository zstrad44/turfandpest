class CategoriesController < ApplicationController

    def new
        @category = Category.new
    end
    def edit
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.build(category_params)
        respond_to do |format|
            if @category.save
                format.html { redirect_to product_management_path, notice: "Nice! You just added a new category!"}
                format.json { render :product_management, status: :created, location: @category }
            else
                format.html { render :new}
                format.json { render json: @category.errors, status: :unprocessable_entity }
                flash[:alert] = "Something wen't wrong! Please try again.."
                flash[:alert] = '<span class="bolder"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Error!&nbsp; Category Not Created Because: </span><br>' + @category.errors.full_messages.join("<br>").html_safe
            end
        end
    end

    def update
        @category = Category.find(params[:id])
        respond_to do |format|
            if @category.update(category_params)
                format.html { redirect_to product_management_path, notice: "Nice! Category has been updated successfully!"}
                format.json { render :product_management, status: :updated, location: @category }
            else
                format.html { render :edit}
                format.json { render json: @category.errors, status: :unprocessable_entity }
                flash[:alert] = "Something wen't wrong! Please try again.."
                flash[:alert] = '<span class="bolder"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Error!&nbsp; Category Not Updated Because: </span><br>' + @category.errors.full_messages.join("<br>").html_safe
            end
        end
    end
    def destroy
        @category = Category.find(params[:id])
        respond_to do |format|
            if @category.destroy
                format.html { redirect_to product_management_path, notice: "Category has been deleted successfully!"}
                format.json { render :product_management, status: :destroyed, location: @category }
            else
                format.html { redirect_to product_management_path }
                format.json { render json: @category.errors, status: :unprocessable_entity }
                flash[:alert] = "Something wen't wrong! Please try again.."
                flash[:alert] = '<span class="bolder"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> Error!&nbsp; Category Not Deleted Because: </span><br>' + @category.errors.full_messages.join("<br>").html_safe
            end
        end
    end

    protected

        def category_params
            params.require(:name, :subject, tags: [])
        end

end
