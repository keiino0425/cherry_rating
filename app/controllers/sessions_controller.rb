class SessionsController < ApplicationController
  def new; end

  def create
    SpreadsheetsImportJob.perform_now("1MDPFwFVab9_xnbPcMV2eMCd6PwVF_to6FMMytd54wwA", ["データ読取用!A:O"])
    user = User.find_by(user_name: params[:session][:user_name])
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = '名前かパスワードが正しくありません!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to 'new'
  end
end
