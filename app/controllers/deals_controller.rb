class DealsController < ActionController::Base

    def create
        @deal = Deal.new
        @deal.name = params[:deal][:name]
        @deal.entry_cash = params[:deal][:entry_cash]
        @deal.interim_growth = params[:deal][:interim_growth]
        @deal.terminal_growth = params[:deal][:terminal_growth]
        @deal.discount_rate = params[:deal][:discount_rate]
        @deal.npv = @deal.npv_func
        @deal.save
        redirect_to deal_path(@deal)
    end

    def show
        @deal = Deal.find(params[:id])
    end

end