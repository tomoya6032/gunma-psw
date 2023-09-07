class UpdateActiveStorageBlobsServiceName < ActiveRecord::Migration[6.0]
  def up
    # 既存のレコードに適切な service_name の値を設定
    ActiveStorage::Blob.update_all(service_name: 'amazon')
    
    # service_name カラムに NOT NULL 制約を追加
    change_column_null :active_storage_blobs, :service_name, false
  end

  def down
    # ロールバック時の処理を記述する場合はここに記述
  end
end
