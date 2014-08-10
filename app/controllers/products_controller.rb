class ProductsController < ApplicationController
	before_action :get_user, 

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = @user.products.new(product_params)
		if @product.save
			redirect_to user_products_path
		end
	# else
	# 	render 'new'
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_params)
			redirect_to user_products_path
		else
			render 'edit'
		end
	end

	def destroy
		Product.find(params[:id]).destroy
		redirect_to user_products_path
	end

	def product_params
		params.require(:product).permit(:user_id, :name, :category, :subcategory, :make, :description, :warranty, :w_length, :p_price, :c_price, :purchased_on)
	end

private
  def get_user
    @user = current_user
  end

end
