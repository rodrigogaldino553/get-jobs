class AddDefaultValueToJobsLimitDate < ActiveRecord::Migration[7.0]
  def change
    change_column_default :jobs, :limit_date, Time.current.next_month
  end
end
