class ArticlesController < ApplicationController

    before_action :set_seticle, only: [:show, :edit, :update, :destroy]
    
    def index
        @articles = Article.all
    end
    
    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_param)
        @article.user = User.last
        if @article.save
            redirect_to @article
            flash[:notice] = "Article was created successfully."
        else
            render 'new'
        end
        
    end


    def edit
    end


    def update
        if @article.update(article_param)
            flash[:notice] = "Article updated successfully"
            redirect_to @article
        else
            render 'edit'
        end


    end


    def destroy
        @article.destroy

        redirect_to articles_path
    end

    private 
    
    def set_seticle
        @article = Article.find(params[:id])
    end

    def article_param
        params.require(:article).permit(:title, :description)
    end

end