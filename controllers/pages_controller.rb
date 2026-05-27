class PagesController < ApplicationController

    def home
    end

    def salut
        @name = params[:name]
    end
    
end