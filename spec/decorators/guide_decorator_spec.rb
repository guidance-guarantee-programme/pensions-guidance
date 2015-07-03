require_relative './shared_examples_for_a_guide_decorator'

RSpec.describe GuideDecorator, type: :decorator do
  it_behaves_like 'a guide decorator'

  describe 'subclasses' do
    subject(:decorator) { described_class.new(double) }

    specify 'must implement #title' do
      expect { decorator.title }
        .to raise_error('GuideDecorator subclasses must implement title')
    end

    specify 'must implement #content' do
      expect { decorator.content }
        .to raise_error('GuideDecorator subclasses must implement content')
    end
  end

  describe '.for' do
    let(:guide) { Guide.new('test-guide', content_type: content_type) }

    subject(:decorator) { GuideDecorator.for(guide) }

    context 'given a govspeak guide' do
      let(:content_type) { :govspeak }

      it { is_expected.to be_a(GovspeakGuideDecorator) }
    end

    context 'given an HTML guide' do
      let(:content_type) { :html }

      it { is_expected.to be_a(HTMLGuideDecorator) }
    end
  end

  describe '.cached_for' do
    let(:guide) { double }

    subject(:cached_decorator) { described_class.cached_for(guide) }

    before do
      expect(described_class).to receive(:for).with(guide)
    end

    it { is_expected.to be_a(CachedGuideDecorator) }
  end

  describe '#label' do
    let(:guide) { Guide.new('test-guide', metadata: metadata) }
    let(:metadata) { Guide::Metadata.new(label: label) }

    subject { described_class.new(guide).label }

    context 'when the guide specifies a label' do
      let(:label) { 'Document label' }

      it 'returns the label' do
        is_expected.to eq(label)
      end
    end

    context 'when the guide specifies a blank label' do
      let(:label) { '' }

      it 'returns the title' do
        expect { subject }.to raise_error('GuideDecorator subclasses must implement title')
      end
    end

    context 'when the guide specifies no label' do
      let(:label) { nil }

      it 'returns the title' do
        expect { subject }.to raise_error('GuideDecorator subclasses must implement title')
      end
    end
  end
end
