class BookFormatsController < ApplicationController
  before_action :set_book_format, only: [:show, :edit, :update, :destroy]

  # GET /book_formats
  # GET /book_formats.json
  def index
    @book_formats = BookFormat.all
  end

  # GET /book_formats/1
  # GET /book_formats/1.json
  def show
  end

  # GET /book_formats/new
  def new
    @book_format = BookFormat.new
  end

  # GET /book_formats/1/edit
  def edit
  end

  # POST /book_formats
  # POST /book_formats.json
  def create
    @book_format = BookFormat.new(book_format_params)

    respond_to do |format|
      if @book_format.save
        format.html { redirect_to @book_format, notice: 'Book format was successfully created.' }
        format.json { render :show, status: :created, location: @book_format }
      else
        format.html { render :new }
        format.json { render json: @book_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_formats/1
  # PATCH/PUT /book_formats/1.json
  def update
    respond_to do |format|
      if @book_format.update(book_format_params)
        format.html { redirect_to @book_format, notice: 'Book format was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_format }
      else
        format.html { render :edit }
        format.json { render json: @book_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_formats/1
  # DELETE /book_formats/1.json
  def destroy
    @book_format.destroy
    respond_to do |format|
      format.html { redirect_to book_formats_url, notice: 'Book format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_format
      @book_format = BookFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_format_params
      params.require(:book_format).permit(:book_id, :book_format_type_id)
    end
end
