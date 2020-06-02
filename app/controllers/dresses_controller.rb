class DressesController < ApplicationController
  def index
    @dresses = Dress.all;
  end

  def new
    @dress = Dress.new;
  end

  def create
    @dress = Dress.new(dress_params)
    if @dress.save
      redirect_to dress_path(@dress)
    else
      flash[:danger] = @dress.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @dress = Dress.find(params[:id])
  end

  def show
    @dress = Dress.find(params[:id])
  end

  def update
    @dress = Dress.find(params[:id])
    if @dress.update(dress_params)
      redirect_to @dress
    else
      flash[:danger] = @dress.errors.full_messages.to_sentence
      redirect_to :edit and return
    end
  end

  def search
    @searched_item = params[:search]
    @sort_by = params[:sort_by]
    @order_by = @sort_by!="" ? params[:order] : ""
    # byebug
    @searches = Dress.where("name LIKE ?","%#{@searched_item}%").order("#{@sort_by} #{@order_by}")
    
  end

  def destroy
    @dress = Dress.find(params[:id])
    @dress.destroy
    redirect_to root_path
  end

  private
    def dress_params
      params.require(:dress).permit(:name, :size, :color, :description,:price, :dress_img)
    end
end
