class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @bookss = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @bookss = current_user
    @books = Book.all
    if @book.save
      flash[:notice1] = "Book has been created successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice2] = "Book has been updated successfully."
      redirect_to book_path
    else
      render:edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
