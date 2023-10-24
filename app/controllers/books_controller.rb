class BooksController < ApplicationController
  def index
    @book=Book.new
    @books=Book.all
    @user=User.find(current_user.id)
  end
  
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to books_path
  end

  def show
    @book=Book.find(params[:id])
    @user=User.find(current_user.id)
  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
