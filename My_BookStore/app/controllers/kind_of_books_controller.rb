class KindOfBooksController < ApplicationController
  before_action :set_kind_of_book, only: [:show, :edit, :update, :destroy]

  def index
    @kind_of_books = KindOfBook.all
  end

  def show
    if params[:search].present?
      @kind_of_books = Book.where("name like? and kind_id =?", "%#{params[:search]}%", params[:id]).paginate(:page => params[:page], :per_page => 8)
    else
      @kind_of_books = Book.where(kind_id: params[:id]).paginate(:page => params[:page], :per_page => 8)
    end
  end


  def new
    @kind_of_book = KindOfBook.new
  end


  def edit
  end


  def create
    @kind_of_book = KindOfBook.new(kind_of_book_params)

    respond_to do |format|
      if @kind_of_book.save
        format.html { redirect_to @kind_of_book, notice: 'Kind of book was successfully created.' }
        format.json { render :show, status: :created, location: @kind_of_book }
      else
        format.html { render :new }
        format.json { render json: @kind_of_book.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @kind_of_book.update(kind_of_book_params)
        format.html { redirect_to @kind_of_book, notice: 'Kind of book was successfully updated.' }
        format.json { render :show, status: :ok, location: @kind_of_book }
      else
        format.html { render :edit }
        format.json { render json: @kind_of_book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @kind_of_book.destroy
    respond_to do |format|
      format.html { redirect_to kind_of_books_url, notice: 'Kind of book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_kind_of_book
      @kind_of_book = KindOfBook.find(params[:id])
    end

    def kind_of_book_params
      params.fetch(:kind_of_book, {})
    end
  end
