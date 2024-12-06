class MainController < ApplicationController
  def index
    @app_name = "Task Manager"
  end

  def about
    @developer_name = "Iman Ghavami"
  end
end
