class Adapters::BackupServiceAdaptor
  def initialize
    @adaptee = ENV['RAILS_ENV'] == 'test' ? nil : Adapters::BackupServiceAdaptee.new
  end

  def create_backup
    @adaptee&.create_backup
  end

  def get_backup(id)
    @adaptee&.get_backup(id)
  end
end
