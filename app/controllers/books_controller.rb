class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def show
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end
