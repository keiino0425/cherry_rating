require "google/apis/sheets_v4"

class Google
  class Spreadsheets
    def initialize
      @service = Google::Apis::SheetsV4::SheetsService.new
      @service.authorization = authorize
    end
  
    # 認証
    def authorize
      json_key = JSON.generate(
        private_key: ENV['GOOGLE_PRIVATE_KEY'],
        client_email: ENV['GOOGLE_CLIENT_EMAIL']
      )

      json_key_io = StringIO.new(json_key)

      authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
        json_key_io: json_key_io,
        scope: ["https://www.googleapis.com/auth/spreadsheets"]
      )
      authorizer.fetch_access_token!
      authorizer
    end

    # 指定されたスプレッドシートIDとレンジ（範囲）から値を取得
    def get_values
      @service.get_spreadsheet_values("1MDPFwFVab9_xnbPcMV2eMCd6PwVF_to6FMMytd54wwA", ["名簿!B:C"])
    end
  end
end