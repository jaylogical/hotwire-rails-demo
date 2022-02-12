class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find params[:id]
  end

  def edit
    @article = Article.find params[:id]
  end

  def create
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        redirect_to article_url(@article), notice: "article was successfully created"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    @article = Article.find params[:id]

    if @article.update article_params
      redirect_to article_url(@article)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(
      :byline,
      :content,
      :name,
      :published_on,
      category_ids: []
    )
  end
end
