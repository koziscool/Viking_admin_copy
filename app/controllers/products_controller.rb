class ProductsController < ApplicationController

  def index
    @products = Product.all
  end


  def show
    @product = Product.find( params[:id] )
    puts @product.name
  end


  def cart
    render :cart
  end

end
