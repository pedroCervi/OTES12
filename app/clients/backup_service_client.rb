module Clients
  class BackupServiceClient
    def initialize
      @backup_service_adaptor = Adapters::BackupServiceAdaptor.new
    end

    def create_backup
      @backup_service_adaptor.create_backup
    end

    def get_backup(id)
      @backup_service_adaptor.get_backup(id)
    end
  end
end
