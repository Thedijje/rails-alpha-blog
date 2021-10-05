class ApplicationController < ActionController::Base
    def index
        render 'pages/home'
    end
end
