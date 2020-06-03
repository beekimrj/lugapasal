class DressesController < ApplicationController
  def index
    @dresses = Dress.all
  end

  def new
    @dress = Dress.new;
  end

  def create
    @dress = Dress.new(dress_params)
    @dress.size = params[:size]
    @dress.color = format_text(@dress.color)
    @dress.name = format_text(@dress.name)
    # byebug
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
    if !params[:size].nil?
      @dress.size = params[:size]
    end
    params[:dress][:color] = format_text(params[:dress][:color])
    params[:dress][:name] = format_text(params[:dress][:name])
    if @dress.update(dress_params)
      redirect_to @dress and return
    end
    flash[:danger] = @dress.errors.full_messages.to_sentence
    render :edit
  
  end

  def search
    @searched_item = params[:search]
    @sort_by = params[:sort_by]
    @dress_size = params[:dress_size]
    @dress_color = params[:dress_color]
    @order_by = @sort_by!="" ? params[:order] : ""
    @searches = Dress.where("name LIKE ?","%#{@searched_item}%").order("#{@sort_by} #{@order_by}")
    # search.size[1..-2].split('"').select{|b| b!="" && b!= ","} reverses string into array, useful when array is converted into string
    @searches = @searches.select{ |search| search.size[1..-2].split('"').select{|b| b!="" && b!= ","}.include?(@dress_size)}
    if @dress_color != ""
      @searches = @searches.select{ |search| search[:color] == @dress_color}
    end
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

    def format_text(record)
      if record != ""
      record = record.downcase
      record[0] = record[0].capitalize
      end
      record
    end
end
