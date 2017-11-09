class BookFormatTypesController < ApplicationController
  before_action :set_book_format_type, only: [:show, :edit, :update, :destroy]

  # GET /book_format_types
  # GET /book_format_types.json
  def index
    @book_format_types = BookFormatType.all
  end

  # GET /book_format_types/1
  # GET /book_format_types/1.json
  def show
  end

  # GET /book_format_types/new
  def new
    @book_format_type = BookFormatType.new
  end

  # GET /book_format_types/1/edit
  def edit
  end

  # POST /book_format_types
  # POST /book_format_types.json
  def create
    @book_format_type = BookFormatType.new(book_format_type_params)

    respond_to do |format|
      if @book_format_type.save
        format.html { redirect_to @book_format_type, notice: 'Book format type was successfully created.' }
        format.json { render :show, status: :created, location: @book_format_type }
      else
        format.html { render :new }
        format.json { render json: @book_format_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_format_types/1
  # PATCH/PUT /book_format_types/1.json
  def update
    respond_to do |format|
      if @book_format_type.update(book_format_type_params)
        format.html { redirect_to @book_format_type, notice: 'Book format type was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_format_type }
      else
        format.html { render :edit }
        format.json { render json: @book_format_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_format_types/1
  # DELETE /book_format_types/1.json
  def destroy
    @book_format_type.destroy
    respond_to do |format|
      format.html { redirect_to book_format_types_url, notice: 'Book format type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_format_type
      @book_format_type = BookFormatType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_format_type_params
      params.require(:book_format_type).permit(:name, :physical)
    end
end
