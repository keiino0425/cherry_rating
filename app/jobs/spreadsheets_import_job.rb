class SpreadsheetsImportJob < ApplicationJob
  queue_as :default

  # 行の構造を定義
  Row = Struct.new(
    :user_name,
    :password,
    :chip,
    :winning_streak,
    :point,
    :a_rule_game,
    :a_rule_first_place,
    :a_rule_second_place,
    :a_rule_third_place,
    :a_rule_rating,
    :b_rule_game,
    :b_rule_first_place,
    :b_rule_second_place,
    :b_rule_third_place,
    :b_rule_rating,
  )

  def perform(spreadsheet_id, range)    
    res = google_spreadsheet_service.values("1MDPFwFVab9_xnbPcMV2eMCd6PwVF_to6FMMytd54wwA", ["データ読取用!A:O"])
    return if res.values.empty? # 値が空だった場合はここで終了

    res.values.drop(1).each do |row_data| # 1行目はヘッダーなので削除
      row = Row.new(*row_data)
      attributes = row.to_h.slice(
        :user_name,
        :password,
        :chip,
        :winning_streak,
        :point,
        :a_rule_game,
        :a_rule_first_place,
        :a_rule_second_place,
        :a_rule_third_place,
        :a_rule_rating,
        :b_rule_game,
        :b_rule_first_place,
        :b_rule_second_place,
        :b_rule_third_place,
        :b_rule_rating,
      )

      # 重複するデータを作成したくないのでfind_or_initialize_byを使用
      user = User.find_or_initialize_by(attributes)
      user.save
    end
  end

  private

    def google_spreadsheet_service
      @google_spreadsheet_service ||= Google::Spreadsheets.new
    end
end
