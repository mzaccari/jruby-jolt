require 'spec_helper'

describe Jolt do

  describe '.transform' do

    let(:name)   { :test }
    let(:input)  { parse_json(fixture('input.json')) }
    let(:spec)   { parse_json(fixture('spec.json')) }
    let(:output) { parse_json(fixture('output.json')) }

    context 'when given a name that does not exist' do
      it 'throws an exception' do
        expect { Jolt.transform(:invalid_name, input) }.to raise_error(Jolt::SpecError)
      end
    end

    context 'when the spec exists' do
      before { Jolt.load_spec(name, spec) }
      after  { Jolt.clear_specs }

      context 'when given valid input data' do
        it 'transforms the data' do
          expect(Jolt.transform(name, input)).to eq output
        end
      end
    end
  end

end
