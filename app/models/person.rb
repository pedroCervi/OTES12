class Person < ActiveRecord::Base
  attr_accessor :components

  def errors
    @errors ||= {}
  end
end
