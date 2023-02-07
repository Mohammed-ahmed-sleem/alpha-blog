class ArticlesController < ApplicationController
    def show
    # byebug
     @article = Article.find(params[:id])
    end
    def index
     @articles = Article.all
    end 
    def new
    end
    def create
    @article = Article.new(params.require(:article).permit(:title, :description))  
    @article.save
    redirect_to article_path(@article) 
    # redirect_to @article
    



# => require the top level key off article and permit  title and description 
      #only the permitted attributes are passed into the model
      #What is params require in Rails?
      #In Rails, strong params provide an interface for protecting attributes from the end-user assignment.
      # We can specify required attributes and neglect unnecessary attributes to be used in the Active model mass assignment
      # (render plain: @article.inspect)
    end

  end