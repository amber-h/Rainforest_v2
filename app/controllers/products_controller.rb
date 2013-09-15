class ProductsController < ApplicationController
  before_filter :ensure_logged_in, :only => [:show]
  before_filter :get_product, :only => [:show, :edit, :destroy, :update]

  def index
  	@products = Product.all

  	respond_to do |format|
  		format.html 
  		format.json { render json: @products}
  	end
  end

  def show
    @reviews = @product.reviews.order("created_at DESC")

    if current_user
      @review = @product.reviews.build
    end

  	respond_to do |format|
  		format.html 
  		format.json { render json: @product}
  	end

  end

  def new
  	@product = Product.new

  	respond_to do |format|
  		format.html 
  		format.json { render json: @products}
  	end
  end

  def edit 
  end

def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
end

  def update 

  	if @product.update_attributes(params[:product])
  		format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
  	else 
  		format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
  	end
  end

  def destroy
  	@product.destroy

  	respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
  def get_product
    @product = Product.find(params[:id])
  end

end
