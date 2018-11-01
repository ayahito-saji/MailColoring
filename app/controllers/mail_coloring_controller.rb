class MailColoringController < ApplicationController
  def mail_coloring
    render plain: coloring_text(params[:body])
  end
end
