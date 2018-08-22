require 'spec_helper'

RSpec.describe Stack do

  let(:stack) { Stack.new }

  # 1.push 出来る?
  describe "push" do
    subject { stack.push 1 }
    it { expect(subject).to eq stack }
    it '数がpushした回数と一致' do
      subject
      expect(stack.length).to eq 1
    end
  end

  # 2.pop 出来る?
  describe "pop" do
    subject { stack.pop }
    context "空の stack" do
      it { expect(subject).to eq nil}
      it '数は0' do
        subject
        expect(stack.length).to eq 0
      end
    end

    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to eq 1 }
      it '数が減っている' do
        subject
        expect(stack.length).to eq 0
      end
    end

    context "1 と 5 を push 済みの stack" do
      before do
        stack.push 1
        stack.push 5
      end
      it { expect(subject).to eq 5 }
      it '数が減っている' do
        subject
        expect(stack.length).to eq 1
      end
    end
  end

  # 3.length を取得出来る?
  describe '"length"'do
    subject { stack.length }

    context "空の stack" do
      it { expect(subject).to eq 0}
    end

    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to eq 1 }
    end

    context "1 と 5 を push 済みの stack" do
      before do
        stack.push 1
        stack.push 5
      end
      it { expect(subject).to eq 2 }
    end
  end

  # 4.empty? かどうかを尋ねられる？
  describe '"empty?"'do
    subject { stack.empty? }
    context "空の stack" do
      it { expect(subject).to eq true}
    end
    context "1 を push 済みの stack" do
      before { stack.push 1 }
      it { expect(subject).to eq false }
    end
  end
end
