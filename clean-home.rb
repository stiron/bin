#!/usr/bin/env ruby

require 'fileutils'

FileUtils.cd(ENV["HOME"]) do
  FileUtils.rm Dir.glob('.goutputstream-*')
  FileUtils.rm Dir.glob('libpeerconnection.log')
end