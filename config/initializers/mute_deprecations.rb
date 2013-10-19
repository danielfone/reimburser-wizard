_muted_deprecations = %w(
)

_default_deprecation_behaviours = ActiveSupport::Deprecation.behavior
ActiveSupport::Deprecation.behavior = Proc.new do |msg, stack|
  next if _muted_deprecations.any? {|s| stack.first[s] }
  _default_deprecation_behaviours.each do |behaviour|
    behaviour.call msg, stack
  end
end
