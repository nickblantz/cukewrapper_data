# frozen_string_literal: true

module Cukewrapper
  # I process data >:^)
  class DataSourceLoader < Remapper
    require 'json'

    priority :high

    def run(context)
      return unless @enabled

      context['data'] = remap(load_data)
    end

    def register_hooks
      Hooks.register("#{self.class.name}:enable", :after_metatags, &enable)
    end

    def enable
      lambda do |_context, metatags|
        @metatags = metatags['data'] || {}
        @source = @metatags['source']
        @external_remap = @metatags['remap']
        @enabled = !@metatags.nil?
        LOGGER.debug("#{self.class.name}\##{__method__}") { @enabled }
      end
    end

    private

    def load_data
      return {} if @source.nil?

      LOGGER.debug("#{self.class.name}\##{__method__}") { "Loading data from #{@source}" }
      JSON.parse(File.read(@source))
    end

    def remap(data)
      return data if @external_remap.nil?

      LOGGER.debug("#{self.class.name}\##{__method__}") { "Running external remap at #{@external_remap}" }
      load @external_remap
      data_remap(data)
    end
  end
end
