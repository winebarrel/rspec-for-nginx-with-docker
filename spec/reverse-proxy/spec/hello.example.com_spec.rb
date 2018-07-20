describe server('hello.example.com') do
  let(:res) { response }
  let(:req) { OpenStruct.new(JSON.parse(res.body)) }

  describe http('https://hello.example.com/') do
    specify do
      expect(res.status).to eq 200
      expect(req.header.fetch('x-forwarded-server')).to eq ['hello.example.com']
      expect(req.request_method).to eq 'GET'
    end
  end
end
