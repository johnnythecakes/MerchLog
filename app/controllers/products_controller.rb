class ProductsController < ApplicationController
	before_action :get_user

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@war_exp = @product.purchased_on + @product.w_length.months
		@remaining_w = (@war_exp - Date.today).to_i 
	end

	def new
		@user = current_user
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		# @user = current_user
		@product.user = current_user
		if @product.save
			redirect_to user_products_path
	else
		render 'new'
	end
end

	def edit
		if current_user == Product.find(params[:id]).user
		@product = Product.find(params[:id])
	end
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
		params.require(:product).permit(:name, :category, :subcategory, :make, :description, :warranty, :w_length, :p_price, :c_price, :purchased_on)
	end

	private
	  def get_user
	    @user = current_user
	    @user = User.where(:id => params[:user_id]).first
		end

end
