# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
get '/', to: ->(env) do
  [
    200,
    {},
    [
      <<~EOS
        <h1>GOTHLOLICHAN</h1>
        <p>
          Gothlolichan's equation feature is
          <a href="http://www.codecogs.com" target="_blank">
            <img src="http://www.codecogs.com/images/poweredbycodecogs.png" border="0" title="CodeCogs - An Open Source Scientific Library" alt="CodeCogs - An Open Source Scientific Library">
          </a>
        </p>
      EOS
    ]
  ]
end
