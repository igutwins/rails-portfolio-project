class DealsController < ActionController::Base

    def create
        @deal = Deal.new
        @deal.name = params[:name]
        @deal.entry_cash = params[:entry_cash]
        @deal.interim_growth = params[:interim_growth]
        @deal.terminal_growth = params[:terminal_growth]
        @deal.discount_rate = params[:discount_rate]
        @deal.save
        redirect_to deal_path(@deal)
    end

end 