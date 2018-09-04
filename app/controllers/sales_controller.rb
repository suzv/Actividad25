class SalesController < ApplicationController
  def index
    @sale = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    total = @sale.value - (@sale.value * (@sale.discount / 100.0)
    @sale.value = total.to_i
    if @sale.save
      redirect_to sales_path
    else
      redirect_to sales_new_path
    end
  end

  private
  def sale_params
    params.require(:sale).permit(:cod,:detail,:category,:value,:discount,:tax,:total)
  end
