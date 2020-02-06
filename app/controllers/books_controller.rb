class BooksController < ApplicationController

  def edit
    @book = Book.find(params[:id])
    if
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book,
      notice: '{@book.title} successfully posted'
    else
      render :index
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book,
      notice: '{@book.title} successfully updated'
    else
      render :index
    end
  end
  def destory
    book = Book.find(params[:id])
    if book.destory
      redirect_to books_path,
        notice: '{@book.title} successfully deleted'
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion, :user_id)
  end
end
