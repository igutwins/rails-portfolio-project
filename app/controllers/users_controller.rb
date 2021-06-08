class UsersController < ApplicationController

    def new
        @user = User.new
        @titles = Title.all
    end 

    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                session[:user_id] = @user.id
                format.html { redirect_to user_deals_path(@user), notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end 
        end 
    end

    def create_deal
        @deal = Deal.new(deal_params) #strong params
        @deal.npv = @deal.npv_func
        @deal.deal_team = DealTeam.first ##this is bad and needs to be changed

        respond_to do |format|
            if @deal.save
                format.html { redirect_to @deal, notice: 'Deal was successfully created.' }
                format.json { render :show, status: :created, location: @deal }
            else
                raise params.inspect
                format.html { render :new }
                format.json { render json: @deal.errors, status: :unprocessable_entity }
            end 
        end 

    end 

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :title_id, :tenure)
    end

end
