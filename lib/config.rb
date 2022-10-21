require "erb"
require "yaml"

module Config
    def self.[](config_file)
        config_file = config_file.to_sym

        @config_cache ||= {}
        @config_cache[config_file] ||= _load_config_from_file(config_file)
    end

    def self._load_config_from_file(file_name)
        file_path = _config_path(file_name)
        return {} unless File.exist?(file_path)

        (YAML.load(ERB.new(File.read(file_path)).result.strip) || {})
    end

    def self._config_path(file_name)
        file_path = File.expand_path(File.join(__dir__, "..", "config", "#{file_name}.yml"))
        return file_path if File.exist?(file_path)

        raise "Could not find configuration for '#{file_name}'"
    end
end