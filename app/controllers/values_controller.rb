class ValuesController < ApplicationController
    def show
        @metric_name = params[:metric_name]
        @user = params[:user]
        @id = params[:id]
        @metric_id = params[:metric_id]
        @href = params[:href]

        @value = Value.find(params[:href])
    end

    def update
        value_link = params[:value]['href']
        new_value = params[:value]['value']

        value = Value.find(value_link)
        value.value = new_value
        Value.update(value_link, value)

        redirect_to :root
    end
end
