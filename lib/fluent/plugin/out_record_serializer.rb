require 'fluent/plugin/record_serializer'
require 'fluent/plugin/filter'

module Fluent
  class Plugin::RecordSerializerOutput < Plugin::Output
    Fluent::Plugin.register_output('record_serializer', self)

    def multi_workers_ready?
      true
    end
    
    unless method_defined?(:router)
      define_method("router") { Fluent::Engine }
    end 

    config_param :tag, :string
    config_param :format, :string, :default => 'json'
    config_param :field_name, :string, :default => 'payload'

    include SetTagKeyMixin
    include Fluent::RecordSerializer

    def emit(tag, es, chain)
      es.each { |time, record|
        begin
          serialized_record = serialize_record(@format, record)
        rescue => e
          $log.warn "serialize error: #{e.message}"
          next
        end

        router.emit(@tag, time, {
          'tag' => @tag,
          @field_name => serialized_record
        })
      }

      chain.next
    end
  end
end
