class AdvertsController < ApplicationController
  
  def show
    @advert = Advert.find(params[:id])
  end  
  
  def new 
    @advert = Advert.new
  end

  def create
    @advert = Advert.new(params[:advert])
    if @advert.save
      redirect_to @advert, notice: "Advert has been created!"
    else
      render action: "new"
    end
  end

  def edit
    @advert = Advert.find(params[:id])
  end

  def update
    @advert = Advert.find(params[:id])
    if @advert.update_attributes(params[:advert]) 
      redirect_to @advert, notice: "Advert has been updated!"
    else
      render action: "edit"
    end
  end

  def destroy
  end
end
