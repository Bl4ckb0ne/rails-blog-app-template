class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "username", password: "password", except: [:index, :show]

	def index
		# Number of articles par pages. Set to 10 by default 
  	@articles = Article.page(params[:page]).per(10)

		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		@articles.each do |item|
			item.text = markdown.render(item.text)
		end
	end

	def show
		# Find an article, and replace the text with rendered markdown
		article = Article.find(params[:id])
		@title = article.title

		markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
		@text = markdown.render(article.text)
	end
	
	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
