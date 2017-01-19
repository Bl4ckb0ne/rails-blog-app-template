class AdminController < ApplicationController
	before_filter :authenticate

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      password = Digest::MD5.hexdigest(password)
      username == 'username' && password == '5f4dcc3b5aa765d61d8327deb882cf99'
    end
  end

	def index
		@articles = Article.all
	end
end
