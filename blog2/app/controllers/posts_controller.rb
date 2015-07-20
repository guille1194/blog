class PostsController < ApplicationController
    def index
         @q= Post.ransack(params[:q])
         @posts=@q.result(distinct: true)
    end

    def show
       @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
        @category = Category.new
    end
    
    def edit
       @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(params[:post].permit(:title, :body, :category_id, :author_id))
        if @post.save
        redirect_to posts_path, :notice => "Your post has been saved"
        else
            render "new"
            end
        end
    
    def update
        @post = Post.find(params[:id])
        
        if @post.update_attributes(params[:post].permit(:title, :body, :category_id, :author_id))
            redirect_to post_path, :notice => "Your post has been updated"
        else 
            render "edit"
        end
    end
    
    def destroy
         @post = Post.find(params[:id])
         @post.destroy
         redirect_to posts_path, :notice => "Your post has been destroyed"
    end
    
end
