class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV["ADMIN_USERNAME"], :password => ENV["ADMIN_PASSWORD"] ,only: [:admin, :show]
  def show
  end
end
