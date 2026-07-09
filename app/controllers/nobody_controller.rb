class NobodyController < ApplicationController
  before_action :check_app_auth, except: [:access_denied, :logout, :login]

  def access_denied
  end

  def login
  end

  def logout
    session[:user] = nil
    redirect_to(root_path, notice: 'Завершение сеанса успешно выполнено!') 
  end
  
  private
  def check_ctr_auth()
    return true 
  end  
end
