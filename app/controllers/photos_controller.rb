class PhotosController < ApplicationController
	before_action :get_product

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    # @product = Product.where(id: params[:product_id]).first
    @photo = Photo.new
  end

  # def create
  #   # Find our parent decision that we should attach to
  #   @photo = @product.photo.new(params.require(:photo).permit(:text, :image))
  #   # Attach this criterion to a decision
  #   # @photo.product = get_product
  #   if @photo.save
  #     redirect_to product_photos_path(:product_id)
  #   else
  #     render 'new'
  #   end
  # end
  def create
    # @product = Product.where(id: params[:product_id]).first
  # Find our parent decision that we should attach to
    @product = get_product
    @photo = Photo.create(photo_params)
    # @photo.date ||= DateTime.now
    # Attach this criterion to a decision
    if @photo.save
      redirect_to product_photo_path(:product_id,)
    else
      render 'new'
    end
  end

private
  def get_product
    @product = Product.where(:id => params[:product_id]).first
  end

  def photo_params
    params.require(:photo).permit(:image, :date, :text, :product_id)
  end
end
