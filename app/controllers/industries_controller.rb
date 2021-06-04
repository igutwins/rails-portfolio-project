class IndustriesController < ApplicationController

    def new
        @industry = Industry.new
    end 

    def create
        @industry = Industry.new(:name => params[:name]) 
        @industry.save
        redirect_to deals_path
    end 

end 