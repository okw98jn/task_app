class Post < ApplicationRecord
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :memo_text, presence: true

  validate :date_before_start
  validate :date_before_end

  require "date"

  #開始日のバリデーション
  def date_before_start
    if start_date == nil
      return
    elsif start_date < Date.today
      errors.add(:start_date, "は今日以降のものを選択してください")
    end
  end


  #終了日のバリデーション
  def date_before_end
    if end_date == nil
      return
    elsif end_date < Date.today
      errors.add(:end_date, "は今日以降のものを選択してください")
    elsif start_date > end_date
      errors.add(:end_date, "は開始日以降のものを選択してください")
    end
  end
end
