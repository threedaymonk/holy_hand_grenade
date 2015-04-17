class HolyHandGrenade
  alias __class__ class
  instance_methods.each do |m|
    undef_method m unless m =~ /^__/
  end

  class Called < RuntimeError; end

  def initialize(name=nil)
    @name = name || "#{self.__class__}_#{self.__id__}"
  end

  def method_missing(method, *args)
    raise Called, "method `#{method}' called on `#{@name}'"
  end
end
