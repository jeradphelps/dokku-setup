class BootstrapProdHelpers
  def self.execute cmd
    PTY.spawn( cmd ) do |stdin, stdout, pid|
      stdin.each { |line| print line }
    end
  end
end