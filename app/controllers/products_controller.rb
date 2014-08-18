class ProductsController < ApplicationController
	before_action :get_user

	def index
		@products = Product.where(:user_id => current_user.id)
		# my_product_filter = params[:productfilter]
		# case my_product_filter
		# when "showall"
		# 	@products = Product.where(:user_id => current_user.id)
		# when "warranties"
		# 	@products = Product.where(:user_id => current_user.id) && @products = Product.where(:warranty => true)
		# when "light"
		# 	@beans = Bean.where(:roast => "light")
		# when "instock"
		# 	@beans = Bean.where(:quantity.gt => 0)
		# else
		# 	@products = Product.where(:user_id => current_user.id)
		# end
	end

	def show
		@product = Product.find(params[:id])
		@war_exp = @product.purchased_on + @product.w_length.months
		@war_tot = (@war_exp - @product.purchased_on).to_i
		@remaining_w = (@war_exp - Date.today).to_i 
		@days_percent = (@remaining_w.to_f / @war_tot.to_f) * 100
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
