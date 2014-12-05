class ApiV1::BooksController < ApiController

	before_action :require_login
	
	# GET /ap1/v1/books 拿所有書櫃的書跟留言
	def index
		@user_books = current_user.user_books

		render :json => { 
				:books => @user_books.map{ |user_book|
					book = user_book.book
				  {
				 	  :id => user_book.book_id, # Book ID
					  :user_id => user_book.user_id,
					  :isbn => book.isbn,
					  :title => book.title,
						:author => book.author,
						:description => book.description,
						:pages => book.pages,
						:publish_date => book.publish_date,
						:cover_large_url => book.cover_large_url,	
						:cover_small_url => book.cover_small_url,
						:publisher => book.publisher,
						:updated_at => user_book.updated_at,
						:created_at => user_book.created_at,
						:comments => book.comments.map { |comment|
							{
								:id => comment.id,
								:user_id => comment.user_id,
								:content => comment.content,
								:photo_large_url => full_url(comment.photo.url),
								:photo_small_url => full_url(comment.photo.url(:thumb)),
								:updated_at => comment.updated_at,
								:created_at => comment.created_at,
							}
						}						  
				  }
			}
		}
	end

	# POST /api/v1/books  新增一本書
	def create
		render :json => { :message => "Ok", :book_id => 123 }
	end

	# DELETE /api/v1/books/{id} 刪除書
	def destroy
		render :json => { :message => "Ok" }
	end

end
