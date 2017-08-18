require 'fluent/plugin/record_serializer'
require 'fluent/plugin/filter'

module Fluent
  class Plugin::RecordSerializerFilter < Plugin::Filter
    Fluent::Plugin.register_filter('record_serializer', self)

    config_param :format, :string, :default => 'json'
    config_param :field_name, :string, :default => 'payload'

    include SetTagKeyMixin
    include Fluent::RecordSerializer

    def multi_workers_ready?
      true
    end

    def filter(tag, time, record)
      begin
        serialized_record = serialize_record(@format, record)
      rescue => e
        $log.warn "serialize error: #{e.message}"
        return
      end

      {'tag' => tag, @field_name => serialized_record}
    end
  end
end
