# frozen_string_literal: true

module Cukewrapper
  # I process data >:^)
  class DataSourceLoader < Cukewrapper::Remapper
    require 'faker'
    require 'json'
    require 'jsonpath'

    priority :high

    def initialize(config)
      super(config)
    end

    def run(context)
      context['data'] = remap(load_data)
    end

    def register_hooks
      Cukewrapper::Hooks.register("#{self.class.name}:after_metatags", :after_metatags) { |_context, metatags| self.handle_metatags(metatags) }
    end

    def handle_metatags(metatags)
      @source = metatags['data']['source']
      @external_remap = metatags['data']['remap']
    end

    private

    def load_data
      unless @source.nil?
        Cukewrapper.log.debug("#{self.class.name}\##{__method__}") { "Loading data from #{@source}" }
        return JSON.parse(File.read(@source))
      end
      {}
    end

    def remap(data)
      return data if @external_remap.nil?

      Cukewrapper.log.debug("#{self.class.name}\##{__method__}") { "Running external remap at #{@external_remap}" }
      load @external_remap
      data_remap(data)
    end
  end
end

