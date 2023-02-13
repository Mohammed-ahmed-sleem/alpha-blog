class ArticlesController < ApplicationController
    def test
    end
    def destroy
      @article = Article.find(params[:id])
      @article.destroy
      flash[:succes] = "Article was  destroyed"
       redirect_to articles_path
    end

    def show
    # byebug
     @article = Article.find(params[:id])
    end
    def index
      @articles = Article.all
    end 
    def new
      @article =Article.new # initiat an @article instance variable for (@article.errors.any?) 
    end

    def edit
      @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
          flash[:notice] = "Article was created successfully."
          redirect_to @article
        else
          render 'new'
        end
    end

    def update
      @article = Article.find(params[:id])
      if @article.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "Article was updated successfully"
        redirect_to @article
      else
        render 'edit'
      end
    end


  
=begin  
    # @article = Article.new(params.require(:article).permit(:title, :description))  
    # if  @article.save
    # flash[:notice] = "Article was created successfully. "
    # redirect_to article_path(@article) 
    # # redirect_to @article
    # else
    #  # byebug
    #   render 'new'
    #   #render_to_body 'new'
    end
=end


=begin
   => require the top level key off article and permit  title and description 
      #only the permitted attributes are passed into the model
      #What is params require in Rails?
      #In Rails, strong params provide an interface for protecting attributes from the end-user assignment.
      # We can specify required attributes and neglect unnecessary attributes to be used in the Active model mass assignment
      # (render plain: @article.inspect)
  
=end
  
end